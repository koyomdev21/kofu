import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:kofu/src/routing/app_router.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have account yet? '),
        TextButton(
          onPressed: () => context.pushNamed(AppRoute.signUp.name),
          child: const Text(
            'Sign up',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
