// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:kofu/src/utils/secure_storage_provider.dart';

class AppDio with DioMixin implements Dio {
  final _storage = const FlutterSecureStorage();
  String? accessToken;
  final Ref ref;

  AppDio.s(
    this.ref, [
    BaseOptions? options,
  ]) {
    options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 401;
      },
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
      final options = Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      );
      return request<dynamic>(requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options);
    }

    Future<bool> refreshToken() async {
      final refreshToken = await _storage.read(key: 'refreshToken');
      final response = await put('/authenticate',
          options: Options(headers: {
            'refreshToken': refreshToken,
          }));

      if (response.statusCode == 200) {
        accessToken = response.data;
        return true;
      } else {
        // refresh token is wrong
        accessToken = null;
        _storage.deleteAll();
        return false;
      }
    }

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          var aT = await ref.read(secureStorageProvider).getAccessToken();
          options.headers['Authorization'] = 'Bearer $aT';
          var uI = await ref.read(appPreferencesProvider).getUserId();
          options.queryParameters[{'id': uI}];
          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          if ((error.response?.statusCode == 401)) {
            if (await _storage.containsKey(key: 'refreshToken')) {
              if (await refreshToken()) {
                return handler.resolve(await _retry(error.requestOptions));
              }
            }
          }
          return handler.next(error);
        },
      ),
    );

    if (kDebugMode) {
      // Local Log
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}

final dioProvider = Provider<Dio>((ref) {
  return AppDio.s(ref);
  // return DioClient().getDio();
});
