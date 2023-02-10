import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:kofu/src/constants/app_sizes.dart';
import 'package:kofu/src/features/authentication/common_widgets/dont_have_account.dart';
import 'package:kofu/src/features/authentication/common_widgets/google_button.dart';
import 'package:kofu/src/features/authentication/common_widgets/or_divider.dart';
import 'package:kofu/src/features/authentication/common_widgets/scrollview_container.dart';
import 'package:kofu/src/features/authentication/common_widgets/auth_validators.dart';
import 'package:kofu/src/features/authentication/common_widgets/sign_up_button.dart';
import 'package:kofu/src/features/authentication/providers/sign_up_notifier_controller_provider.dart';
import 'package:kofu/src/features/dashboard/presentation/providers/dashboard_controller_provider.dart';
import 'package:kofu/src/routing/app_router.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:kofu/src/utils/async_value_ui.dart';

class SignInScreenBase extends ConsumerStatefulWidget {
  const SignInScreenBase({super.key});

  @override
  ConsumerState<SignInScreenBase> createState() => _SignInScreenBaseState();
}

class _SignInScreenBaseState extends ConsumerState<SignInScreenBase>
    with EmailAndPasswordValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get username => _usernameController.text;
  String get password => _passwordController.text;

  var _submitted = false;
  bool _rememberMe = false;

  void _handleRememberMe(bool value) async {
    _rememberMe = value;
    await ref.read(appPreferencesProvider).setRemember(value);
    await ref
        .read(appPreferencesProvider)
        .setUsername(_usernameController.text);
    await ref
        .read(appPreferencesProvider)
        .setPassword(_passwordController.text);
    setState(() {
      _rememberMe = value;
    });
  }

  void _loadRememberMe() async {
    try {
      var username = await ref.read(appPreferencesProvider).getUsername();
      var password = await ref.read(appPreferencesProvider).getPassword();
      var checked = await ref.read(appPreferencesProvider).getRemember();

      if (checked) {
        setState(() {
          _rememberMe = true;
        });
        _usernameController.text = username;
        _passwordController.text = password;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(signUpControllerNotifierProvider.notifier);
      await controller.signIn(
        username,
        password,
      );
    }
  }

  void _usernameEditingComplete() {
    if (canSubmitUsername(username)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (!canSubmitUsername(username)) {
      _node.previousFocus();
      return;
    }
    _submit();
  }

  @override
  void initState() {
    super.initState();
    _loadRememberMe();
  }

  @override
  void dispose() {
    _usernameController.dispose();
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
          onPressed: () {
            context.goNamed(AppRoute.home.name);
            ref.read(dashboardControllerNotifierProvider.notifier).state = 0;
          },
          icon: Image.asset('assets/icons/close.png'),
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
                  'Let\'s get you started!',
                  style: TextStyle(
                      fontSize: Sizes.p24, fontWeight: FontWeight.w700),
                ),
                gapH8,
                const Text(
                  'Continue to your kofo account',
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
                Consumer(
                  builder: (context, ref, child) {
                    final showPassword = ref.watch(showPasswordProvider);
                    return Container(
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
                      ),
                    );
                  },
                ),
                gapH4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            _handleRememberMe(value!);
                          }),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Remember me',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                gapH12,
                PrimaryButton(
                  text: 'Continue',
                  isLoading: state.isLoading,
                  onPressed: state.isLoading ? null : () => _submit(),
                ),
                gapH20,
                const OrDivider(),
                gapH20,
                const GoogleButton(),
                gapH20,
                const DontHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
