import 'package:flutter/material.dart';

import 'package:kofu/src/constants/app_sizes.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Expanded(
          child: Divider(
            height: 20,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        gapW8,
        Text('Or'),
        gapW8,
        Expanded(
          child: Divider(
            height: 20,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
