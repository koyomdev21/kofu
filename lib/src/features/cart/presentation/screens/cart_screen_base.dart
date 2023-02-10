import 'package:flutter/material.dart';

class CartScreenBase extends StatelessWidget {
  const CartScreenBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
