import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/features/authentication/data/remote/remote_auth_repository.dart';
import 'package:kofu/src/features/dashboard/presentation/providers/dashboard_controller_provider.dart';
import 'package:kofu/src/routing/app_router.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:kofu/src/utils/secure_storage_provider.dart';

class SignUpNotifierControllerNotifier extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue build() {
    state = const AsyncData<void>(null);
    return state;
  }

  Future<bool> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    final value = await AsyncValue.guard(() => authRepository.register(
          username,
          email,
          password,
          password,
        ));
    if (value.hasError) {
      state = AsyncError(value.error!, StackTrace.current);
    } else {
      state = const AsyncData<void>(null);
      ref.read(goRouterProvider).pop();
    }
    // if got error will return false
    // if no error will return true
    return state.hasError == false;
  }

  Future<void> signIn(String username, String password) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    final value = await AsyncValue.guard(() => authRepository.signIn(
          username,
          password,
        ));
    if (value.hasError) {
      state = AsyncError(value.error!, StackTrace.current);
    } else {
      state = const AsyncData<void>(null);
      ref.read(dashboardControllerNotifierProvider.notifier).state = 3;
      ref
          .read(appPreferencesProvider)
          .setPermission(value.value?.permissions ?? []);
      ref
          .read(secureStorageProvider)
          .setAccessToken(value.value?.accessToken ?? '');
      ref
          .read(secureStorageProvider)
          .setRefreshToken(value.value?.refreshToken ?? '');
      ref.read(appPreferencesProvider).setUserId(value.value?.item?.id ?? '');
      ref.read(appPreferencesProvider).setLoggedIn();
      ref.read(goRouterProvider).goNamed(AppRoute.profile.name);
    }
  }
}

final signUpControllerNotifierProvider =
    NotifierProvider<SignUpNotifierControllerNotifier, AsyncValue<void>>(
        SignUpNotifierControllerNotifier.new);

final showPasswordProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});
