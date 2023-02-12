import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kofu/src/constants/resources/color_manager.dart';
import 'package:kofu/src/routing/app_router.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:kofu/src/utils/scaffold_global_key.dart';

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final goRouter = ref.watch(goRouterProvider);
//     return MaterialApp.router(
//       routerConfig: goRouter,
//       scaffoldMessengerKey: snackbarKey,
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: myPrimarySwatch,
//         fontFamily: 'Inter',
//         scaffoldBackgroundColor: Colors.grey.shade200,
//       ),
//     );
//   }
// }

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void didChangeDependencies() async {
    final appPrefs = await ref.watch(appPreferencesProvider).getLocal();
    context.setLocale(appPrefs);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: EasyLocalization.of(context)?.locale,
      routerConfig: goRouter,
      scaffoldMessengerKey: snackbarKey,
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
