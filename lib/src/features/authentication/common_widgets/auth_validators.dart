import 'package:kofu/src/features/authentication/common_widgets/string_validators.dart';

/// Mixin class to be used for client-side email & password validation
mixin EmailAndPasswordValidators {
  final StringValidator usernameSubmitValidator = NonEmptyStringValidator();
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordRegisterSubmitValidator =
      MinLengthStringValidator(8);

  bool canSubmitUsername(String username) {
    return usernameSubmitValidator.isValid(username);
  }

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    return passwordRegisterSubmitValidator.isValid(password);
  }

  String? usernameErrorText(String username) {
    final bool showErrorText = !canSubmitUsername(username);
    String errorText = username.isEmpty ? 'Username can\'t be empty' : '';
    return showErrorText ? errorText : null;
  }

  String? emailErrorText(String email) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText =
        email.isEmpty ? 'Email can\'t be empty' : 'Invalid email';
    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(String password) {
    final bool showErrorText = !canSubmitPassword(password);
    final String errorText =
        password.isEmpty ? 'Password can\'t be empty' : 'Password is too short';
    return showErrorText ? errorText : null;
  }
}
