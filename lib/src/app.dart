import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kofu/src/constants/resources/color_manager.dart';
import 'package:kofu/src/routing/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myPrimarySwatch,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
    );
  }
}
