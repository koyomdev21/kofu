import 'package:flutter/material.dart';

class OrderScreenBase extends StatelessWidget {
  const OrderScreenBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Order'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
