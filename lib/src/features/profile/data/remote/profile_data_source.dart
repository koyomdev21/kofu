import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/features/profile/domain/language_response.dart';
import 'package:kofu/src/features/profile/domain/profile_response.dart';
import 'package:dio/dio.dart';

import 'package:kofu/src/network/dio_provider.dart';
import 'package:kofu/src/constants/constant.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_data_source.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class ProfileDataSource {
  factory ProfileDataSource(Dio dio, {String baseUrl}) = _ProfileDataSource;

  @GET("accounts/")
  Future<ProfileResponse> getProfile(
    @CancelRequest() CancelToken cancelToken,
  );

  @PUT("accounts/")
  Future<ProfileResponse> updateProfile(
    @CancelRequest() CancelToken cancelToken,
    @Field("username") String username,
    @Field("email") String email,
    @Field("name") String name,
    @Field("allowPermission") List<String> allowPermission,
  );

  @GET("system/languages/")
  Future<LanguageResponse1> getLanguage();

  @DELETE("authenticate/")
  Future<void> logout();
}

final profileDataSourceProvider = Provider<ProfileDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ProfileDataSource(dio);
});
