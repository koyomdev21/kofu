import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kofu/src/features/dashboard/presentation/providers/dashboard_controller_provider.dart';
import 'package:kofu/src/features/profile/presentation/providers/change_language_controller_provider.dart';
import 'package:kofu/src/routing/app_router.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:kofu/src/utils/async_value_ui.dart';

class ChangeLanguageScreen extends ConsumerWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      changeLanguageNotifierProvider,
      (_, state) {
        state.showAlertDialogOnError(context);
      },
    );
    final state = ref.watch(changeLanguageNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.goNamed(AppRoute.profile.name),
          child: Image.asset('assets/icons/back.png'),
        ),
        centerTitle: true,
        title: const Text('Change language'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: state.when(
        loading: () => const LinearProgressIndicator(),
        error: (error, stackTrace) => Container(
          child: const Text('error happened!'),
        ),
        data: (language) => Container(
          child: ListView.builder(
              itemCount: language.count,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () async {
                    await ref.read(appPreferencesProvider).setLanguageChanged(
                        language.items?[index].code?.substring(0, 2));
                    if (context.mounted) {
                      Phoenix.rebirth(context);
                      context.goNamed(AppRoute.home.name);
                      ref
                          .read(dashboardControllerNotifierProvider.notifier)
                          .state = 0;
                    }
                  },
                  leading: const Icon(Icons.list),
                  title: Text(
                    '${language.items?[index].name}',
                  ),
                );
              }),
        ),
      ),
    );
  }
}
