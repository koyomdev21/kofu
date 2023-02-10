import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/features/authentication/signin/domain/sign_in_response.dart';

abstract class LocalAuthRepository {
  Future<SignInResponse?> fetchUser();

  Future<void> setUser(SignInResponse signInResponse);
}

final localAuthRepositoryProvider = Provider<LocalAuthRepository>((ref) {
  // * Override this in the main method
  throw UnimplementedError();
});
