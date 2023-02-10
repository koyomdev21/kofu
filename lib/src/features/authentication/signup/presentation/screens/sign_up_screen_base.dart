import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:kofu/src/constants/app_sizes.dart';
import 'package:kofu/src/features/authentication/common_widgets/google_button.dart';
import 'package:kofu/src/features/authentication/common_widgets/or_divider.dart';
import 'package:kofu/src/features/authentication/common_widgets/scrollview_container.dart';
import 'package:kofu/src/features/authentication/common_widgets/sign_up_button.dart';
import 'package:kofu/src/features/authentication/common_widgets/auth_validators.dart';
import 'package:kofu/src/features/authentication/common_widgets/string_validators.dart';
import 'package:kofu/src/features/authentication/providers/sign_up_notifier_controller_provider.dart';
import 'package:kofu/src/utils/async_value_ui.dart';

class SignUpScreenBase extends ConsumerStatefulWidget {
  const SignUpScreenBase({super.key});

  @override
  ConsumerState<SignUpScreenBase> createState() => _SignUpScreenBaseState();
}

class _SignUpScreenBaseState extends ConsumerState<SignUpScreenBase>
    with EmailAndPasswordValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get username => _usernameController.text;
  String get email => _emailController.text;
  String get password => _passwordController.text;

  var _submitted = false;

  final snackBar = const SnackBar(
    content: Text('Account created!'),
  );

  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(signUpControllerNotifierProvider.notifier);
      final success = await controller.register(
        username: username,
        email: email,
        password: password,
      );
      if (success) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }
  }

  void _usernameEditingComplete() {
    if (canSubmitUsername(username)) {
      _node.nextFocus();
    }
  }

  void _emailEditingComplete() {
    if (canSubmitEmail(email)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (!canSubmitEmail(email)) {
      _node.previousFocus();
      return;
    }
    _submit();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      signUpControllerNotifierProvider,
      (_, state) {
        state.showAlertDialogOnError(context);
      },
    );
    final state = ref.watch(signUpControllerNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Image.asset('assets/icons/back.png'),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ScrollViewContainer(
        child: FocusScope(
          node: _node,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: Sizes.p24, fontWeight: FontWeight.w700),
                ),
                gapH8,
                const Text(
                  'Create your kofo account',
                  style: TextStyle(
                    fontSize: Sizes.p14,
                    color: Colors.grey,
                  ),
                ),
                gapH20,
                Container(
                  margin: const EdgeInsets.only(bottom: Sizes.p4),
                  padding: const EdgeInsets.only(left: Sizes.p16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextFormField(
                    controller: _usernameController,
                    validator: (username) =>
                        !_submitted ? null : usernameErrorText(username ?? ''),
                    onEditingComplete: () => _usernameEditingComplete(),
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                gapH12,
                Container(
                  margin: const EdgeInsets.only(bottom: Sizes.p4),
                  padding: const EdgeInsets.only(left: Sizes.p16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (email) =>
                        !_submitted ? null : emailErrorText(email ?? ''),
                    onEditingComplete: () => _emailEditingComplete(),
                    inputFormatters: <TextInputFormatter>[
                      ValidatorInputFormatter(
                          editingValidator: EmailEditingRegexValidator()),
                    ],
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                gapH12,
                Container(
                  margin: const EdgeInsets.only(bottom: Sizes.p4),
                  padding: const EdgeInsets.only(left: Sizes.p16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final showPassword = ref.watch(showPasswordProvider);
                      return TextFormField(
                        obscureText: showPassword,
                        controller: _passwordController,
                        validator: (password) => !_submitted
                            ? null
                            : passwordErrorText(password ?? ''),
                        onEditingComplete: () => _passwordEditingComplete(),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: () => ref
                                .read(showPasswordProvider.notifier)
                                .state = showPassword ? false : true,
                            child: showPassword
                                ? Image.asset('assets/icons/pw-hide.png')
                                : Image.asset('assets/icons/pw-show.png'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                gapH12,
                PrimaryButton(
                  text: 'Create Account',
                  isLoading: state.isLoading,
                  onPressed: state.isLoading ? null : () => _submit(),
                ),
                gapH20,
                const OrDivider(),
                gapH20,
                const GoogleButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
