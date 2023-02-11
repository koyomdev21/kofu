import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/features/profile/data/remote/remote_profile_repository.dart';
import 'package:kofu/src/features/profile/domain/profile_response.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:kofu/src/utils/secure_storage_provider.dart';

class ProfileControllerNotifier
    extends AutoDisposeNotifier<AsyncValue<ProfileResponse>> {
  @override
  build() {
    final cancelToken = CancelToken();
    getProfile(cancelToken);
    ref.onDispose(() {
      print('cancelling request');
      cancelToken.cancel();
    });
    return state;
  }

  void getProfile(CancelToken cancelToken) async {
    final profileRepository = ref.read(profileRepositoryProvider);
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    final value =
        await AsyncValue.guard(() => profileRepository.getProfile(cancelToken));
    if (value.hasError) {
      state = AsyncError(value.error!, StackTrace.current);
    } else {
      state = AsyncData<ProfileResponse>(value.value!);
    }
  }

  void logout() async {
    final profileRepository = ref.read(profileRepositoryProvider);
    state = const AsyncLoading();
    final value = await AsyncValue.guard(() => profileRepository.logout());
    if (value.hasError) {
      state = AsyncError(value.error!, StackTrace.current);
    } else {
      state = const AsyncData<ProfileResponse>(ProfileResponse(
        item: null,
        statusCode: null,
        message: null,
        success: null,
      ));
      ref.read(appPreferencesProvider).logout();
      ref.read(secureStorageProvider).deleteAll();
    }
  }
}

final profileControllerNotifierProvider = NotifierProvider.autoDispose<
    ProfileControllerNotifier, AsyncValue<ProfileResponse>>(() {
  return ProfileControllerNotifier();
});
