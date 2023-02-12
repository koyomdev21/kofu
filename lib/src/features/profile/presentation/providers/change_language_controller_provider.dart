import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/features/profile/data/remote/remote_profile_repository.dart';
import 'package:kofu/src/features/profile/domain/language_response.dart';

class ChangeLanguageNotifier
    extends AutoDisposeNotifier<AsyncValue<LanguageResponse1>> {
  @override
  build() {
    state = const AsyncValue.loading();
    getLanguage();
    return state;
  }

  Future<void> getLanguage() async {
    final profileRepository = ref.read(profileRepositoryProvider);
    state = const AsyncLoading();
    await Future.delayed(const Duration(milliseconds: 500));
    final value = await AsyncValue.guard(() => profileRepository.getLanguage());
    if (value.hasError) {
      state = AsyncError(value.error!, StackTrace.current);
    } else {
      state = AsyncData<LanguageResponse1>(value.value!);
    }
  }
}

final changeLanguageNotifierProvider = NotifierProvider.autoDispose<
    ChangeLanguageNotifier,
    AsyncValue<LanguageResponse1>>(ChangeLanguageNotifier.new);
