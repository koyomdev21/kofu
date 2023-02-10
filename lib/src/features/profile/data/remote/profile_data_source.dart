import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/features/profile/domain/profile_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import 'package:kofu/src/network/dio_provider.dart';
import 'package:kofu/src/constants/constant.dart';

part 'profile_data_source.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class ProfileDataSource {
  factory ProfileDataSource(Dio dio, {String baseUrl}) = _ProfileDataSource;

  @GET("accounts")
  Future<ProfileResponse> getProfile();

  @DELETE("authenticate")
  Future<void> logout();
}

final profileDataSourceProvider = Provider<ProfileDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ProfileDataSource(dio);
});
