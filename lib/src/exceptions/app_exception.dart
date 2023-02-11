import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException.unknownErrorHasOccurred() =
      UnknownErrorHasOccurred;
  const factory AppException.duplicateUsername() = DuplicateUsername;
  const factory AppException.invalidFormat() = InvalidFormat;
  const factory AppException.invalidPassword() = InvalidPassword;
  const factory AppException.invalidUsername() = InvalidUsername;
  const factory AppException.sessionExpired() = SessionExpired;
  const factory AppException.noInternet() = NoInternet;
}

class AppExceptionData {
  AppExceptionData(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => 'AppExceptionData(code: $code, message: $message)';
}

extension AppExceptionDetails on AppException {
  AppExceptionData get details {
    return when(
      duplicateUsername: () => AppExceptionData(
        'duplicate-username',
        'Duplicate username',
      ),
      unknownErrorHasOccurred: () => AppExceptionData(
        'unknown-error',
        'Unknown error has occurred',
      ),
      invalidFormat: () => AppExceptionData(
        'invalid-format',
        'Invalid format',
      ),
      invalidPassword: () => AppExceptionData(
        'invalid-password',
        'Invalid password',
      ),
      invalidUsername: () => AppExceptionData(
        'invalid-username',
        'Invalid username',
      ),
      sessionExpired: () => AppExceptionData(
        'session-expired',
        'Session expired. Please relogin',
      ),
      noInternet: () => AppExceptionData(
        'no-internet',
        'Could not connect to network',
      ),
    );
  }
}
