import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/features/authentication/signin/domain/sign_in_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import 'package:kofu/src/features/authentication/signup/domain/sign_up_response.dart';
import 'package:kofu/src/network/dio_provider.dart';
import 'package:kofu/src/constants/constant.dart';

part 'auth_data_source.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AuthDataSource {
  factory AuthDataSource(Dio dio, {String baseUrl}) = _AuthDataSource;

  @POST("accounts")
  Future<SignUpResponse> register(
    @Field('username') String username,
    @Field('email') String email,
    @Field('password') String password,
    @Field('password2') String password2,
  );

  @POST("authenticate")
  Future<SignInResponse> signIn(
    @Field('username') String username,
    @Field('password') String password,
  );
}

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthDataSource(dio);
});
