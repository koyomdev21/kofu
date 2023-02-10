import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:kofu/src/constants/app_sizes.dart';
import 'package:kofu/src/routing/app_router.dart';

class SearchScreenBase extends StatelessWidget {
  const SearchScreenBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.07,
        ),
        child: AppBar(
          elevation: 0.2,
          leading: IconButton(
            onPressed: () => context.goNamed(AppRoute.home.name),
            icon: const Icon(Icons.arrow_back),
          ),
          title: Container(
            margin: const EdgeInsets.only(bottom: Sizes.p4),
            padding: const EdgeInsets.only(left: Sizes.p16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(2),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search for product or shop name',
                border: InputBorder.none,
              ),
            ),
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
