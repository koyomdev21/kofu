import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/exceptions/app_exception.dart';
import 'package:kofu/src/features/authentication/data/remote/auth_data_source.dart';
import 'package:kofu/src/features/authentication/signin/domain/sign_in_response.dart';
import 'package:kofu/src/features/authentication/signup/domain/sign_up_response.dart';

class RemoteAuthRepository {
  RemoteAuthRepository(this.ref);
  final Ref ref;

  Future<SignUpResponse> register(
      String username, String email, String password, String password2) async {
    final authDataSource = ref.watch(authDataSourceProvider);
    final result =
        await authDataSource.register(username, email, password, password2);
    if (result.success!) {
      return result;
    } else if (result.message == "error.account.invalid-format") {
      throw const AppException.invalidFormat();
    } else if (result.message == "error.account.duplicate-username") {
      throw const AppException.duplicateUsername();
    } else {
      throw const AppException.unknownErrorHasOccurred();
    }
  }

  Future<SignInResponse> signIn(String username, String password) async {
    final authDataSource = ref.watch(authDataSourceProvider);
    final result = await authDataSource.signIn(username, password);
    if (result.success!) {
      return result;
    } else if (result.message == "error.account.invalid-username") {
      throw const AppException.invalidUsername();
    } else if (result.message == "error.account.invalid-password") {
      throw const AppException.invalidPassword();
    } else {
      throw const AppException.unknownErrorHasOccurred();
    }
  }
}

final authRepositoryProvider = Provider<RemoteAuthRepository>((ref) {
  return RemoteAuthRepository(ref);
});
