import 'package:flutter/material.dart';
import 'package:kofu/src/constants/app_sizes.dart';

class ScrollViewContainer extends StatelessWidget {
  const ScrollViewContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        left: Sizes.p20,
        right: Sizes.p20,
        top: screenHeight * 0.05,
      ),
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
