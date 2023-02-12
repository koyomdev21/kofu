import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/features/profile/data/remote/remote_profile_repository.dart';
import 'package:kofu/src/routing/app_router.dart';
import 'package:kofu/src/utils/scaffold_global_key.dart';

class EditProfileControllerNotifier
    extends AutoDisposeNotifier<AsyncValue<void>> {
  @override
  build() {
    state = const AsyncValue.data(null);
    ref.onDispose(() {
      print('cancelling request update');
      cancelTokenEdit.cancel();
    });
    return state;
  }

  final cancelTokenEdit = CancelToken();

  Future<void> updateProfile(
    String username,
    String email,
    String name,
  ) async {
    final profileRepository = ref.read(profileRepositoryProvider);
    state = const AsyncLoading<void>();
    final value = await AsyncValue.guard(
      () => profileRepository.updateProfile(
        cancelTokenEdit,
        username,
        name,
        email,
      ),
    );
    if (value.hasError) {
      state = AsyncError(value.error!, StackTrace.current);
    } else {
      state = const AsyncData(null);
      const SnackBar snackBar = SnackBar(
        content: Text("Profile updated"),
      );
      snackbarKey.currentState?.showSnackBar(snackBar);
      ref.read(goRouterProvider).goNamed(AppRoute.profile.name);
    }
  }
}

final editProfileCOntrollerNotifierProvider = NotifierProvider.autoDispose<
    EditProfileControllerNotifier,
    AsyncValue<void>>(EditProfileControllerNotifier.new);
