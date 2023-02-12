// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kofu/src/constants/constant.dart';
import 'package:kofu/src/exceptions/app_exception.dart';
import 'package:kofu/src/features/authentication/signin/domain/sign_in_response.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:kofu/src/utils/scaffold_global_key.dart';
import 'package:kofu/src/utils/secure_storage_provider.dart';

class AppDio with DioMixin implements Dio {
  final _storage = const FlutterSecureStorage();
  String? accessToken;
  AppDio(this.ref, this.dio);
  final Ref ref;
  final Dio dio;

  Dio getDio() {
    final dio = Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 401;
        },
        contentType: 'application/json',
        connectTimeout: 30000,
        sendTimeout: 30000,
        receiveTimeout: 30000,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          var aT = await ref.watch(secureStorageProvider).getAccessToken();
          var rT = await ref.watch(secureStorageProvider).getRefreshToken();
          var uI = await ref.watch(appPreferencesProvider).getUserId();
          if (options.path.contains('accounts/')) {
            if (options.method == 'GET' || options.method == 'PUT') {
              options.path = "${options.path}$uI";
            }
          }
          options.headers['Authorization'] = 'Bearer $aT';
          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          if ((error.response?.statusCode == 401)) {
            if (await _storage.containsKey(key: 'refreshToken')) {
              if (await refreshToken(error.requestOptions)) {
                return handler.resolve(await _retry(error.requestOptions));
              } else {
                const SnackBar snackBar = SnackBar(
                  content: Text("Session expired. Please relogin again"),
                );
                snackbarKey.currentState?.showSnackBar(snackBar);
                _storage.deleteAll();
                ref.read(appPreferencesProvider).logout();
              }
            }
          }
          return handler.next(error);
        },
      ),
    );
    if (kDebugMode) {
      // Local Log
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
    }
    httpClientAdapter = DefaultHttpClientAdapter();

    return dio;
  }

  Future<bool> refreshToken(RequestOptions options) async {
    var refreshToken = await ref.read(secureStorageProvider).getRefreshToken();
    final headers = {'Authorization': 'Bearer $refreshToken'};
    final data = {};
    final baseOptions = BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 402;
      },
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );
    final result = await dio
        .fetch<Map<String, dynamic>>(_setStreamType<SignInResponse>(Options(
      method: 'PUT',
      headers: headers,
    )
            .compose(
              baseOptions,
              'authenticate/',
              data: data,
            )
            .copyWith(baseUrl: Constant.baseUrl)));
    final response = SignInResponse.fromJson(result.data!);

    if (response.success == true) {
      ref.read(secureStorageProvider).setAccessToken(response.accessToken!);
      ref.read(secureStorageProvider).setRefreshToken(response.refreshToken!);
      return true;
    } else if (response.success == false) {
      return false;
    } else {
      throw const AppException.unknownErrorHasOccurred();
    }
  }

  Future<dynamic> _retry(RequestOptions requestOptions) async {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    final aT = await ref.read(secureStorageProvider).getAccessToken();
    final headers = {
      'Authorization': 'Bearer $aT',
    };
    final options = Options(
      method: requestOptions.method,
      headers: headers,
    );
    return dio.request<dynamic>(
        requestOptions.path = '${Constant.baseUrl}${requestOptions.path}',
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

final dioProvider = Provider<Dio>((ref) {
  return AppDio(ref, ref.watch(dioObjectProvider)).getDio();
});

final dioObjectProvider = Provider<Dio>((ref) {
  throw UnimplementedError();
});
