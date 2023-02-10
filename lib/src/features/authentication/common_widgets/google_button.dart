import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 56,
      // child: ElevatedButton.icon(
      //   icon: Image.asset('assets/icons/google.png'),
      //   onPressed: () {},
      //   style: ElevatedButton.styleFrom(
      //     side: const BorderSide(
      //       color: Colors.grey,
      //     ),
      //     backgroundColor: Colors.white,
      //     foregroundColor: Colors.black,
      //     elevation: 0,
      //   ),
      //   label: const Text('Continue with Google'),
      // ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
            color: Colors.grey,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        onPressed: () {},
        child: ListTile(
          leading: Transform.translate(
            offset: const Offset(-10, 2),
            child: Image.asset('assets/icons/google.png'),
          ),
          minLeadingWidth: 70,
          title: const Text('Continue with Google'),
        ),
      ),
    );
  }
}
