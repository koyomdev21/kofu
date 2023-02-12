import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kofu/src/constants/app_sizes.dart';
import 'package:kofu/src/constants/strings_manager.dart';
import 'package:kofu/src/features/profile/presentation/providers/profile_controller_notifier_provider.dart';
import 'package:kofu/src/routing/app_router.dart';
import 'package:kofu/src/utils/async_value_ui.dart';

class ProfileScreenBase extends ConsumerWidget {
  const ProfileScreenBase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      profileControllerNotifierProvider,
      (_, state) {
        state.showAlertDialogOnError(context);
      },
    );
    final profileData = ref.watch(profileControllerNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.profile).tr(),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: profileData.when(
        loading: () => const LinearProgressIndicator(),
        error: (error, stackTrace) => Container(
          child: const Text('error happened!'),
        ),
        data: (profile) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: Sizes.p8),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      leading: Transform.translate(
                        offset: const Offset(0, 1),
                        child: Image.asset(
                            'assets/icons/profile-personal-information.png'),
                      ),
                      minLeadingWidth: 20,
                      title: const Text(
                        'Personal Information',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Image.asset('assets/icons/chevron.png'),
                      onTap: () => context.goNamed(
                        AppRoute.editProfile.name,
                        extra: profile,
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH8,
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          gapH8,
                          Text(
                            '${profile.item?.username}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          gapH8,
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH8,
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          gapH8,
                          Text(
                            '${profile.item?.email}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          gapH8,
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH8,
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          gapH8,
                          Text(
                            '${profile.item?.name}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          gapH8,
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH8,
                          Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          gapH8,
                          const Text(
                            '98761234',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          gapH8,
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH8,
                          Text(
                            'Address',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          gapH8,
                          const Text(
                            'Address detail: lorem ipsum dolor sit amet consectetur adipicscing',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: Sizes.p8),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      leading: Transform.translate(
                        offset: const Offset(0, 1),
                        child: Image.asset('assets/icons/profile-e-wallet.png'),
                      ),
                      minLeadingWidth: 20,
                      title: const Text(
                        'E-Wallet',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Image.asset('assets/icons/chevron.png'),
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH8,
                          Text(
                            'HK\$ ${profile.item?.eWalletBalance}.00',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: Sizes.p8),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () =>
                          context.pushNamed(AppRoute.changeLanguage.name),
                      leading: Transform.translate(
                        offset: const Offset(0, 1),
                        child: Image.asset('assets/icons/profile-e-wallet.png'),
                      ),
                      minLeadingWidth: 20,
                      title: const Text(
                        'Language',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Image.asset('assets/icons/chevron.png'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: Sizes.p8),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => ref
                          .read(profileControllerNotifierProvider.notifier)
                          .logout(),
                      leading: Transform.translate(
                        offset: const Offset(0, 1),
                        child: Image.asset('assets/icons/profile-e-wallet.png'),
                      ),
                      minLeadingWidth: 20,
                      title: const Text(
                        'Logout',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Image.asset('assets/icons/chevron.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
