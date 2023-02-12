import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kofu/src/constants/strings_manager.dart';

class OrderScreenBase extends StatelessWidget {
  const OrderScreenBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.order).tr(),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
