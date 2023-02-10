import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kofu/src/features/authentication/data/remote/remote_auth_repository.dart';
import 'package:kofu/src/routing/app_router.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:kofu/src/utils/secure_storage_provider.dart';

class SignUpNotifierControllerNotifier extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue build() {
    state = const AsyncData<void>(null);
    return state;
  }

  final _storage = const FlutterSecureStorage();

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

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kofu/src/features/authentication/data/auth_repository.dart';

// class SignUpNotifier extends StateNotifier<AsyncValue<void>> {
//   SignUpNotifier(
//     this.ref,
//   ) : super(const AsyncData<void>(null));
//   final Ref ref;

//   void register() async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(
//         () => (ref.read(authRepositoryProvider)).register(
//               "rere",
//               "rere",
//               "rere",
//               "rere",
//             ));
//   }
// }

// final signUpNotifierProvider =
//     StateNotifierProvider<SignUpNotifier, AsyncValue<void>>((ref) {
//   return SignUpNotifier(ref);
// });
