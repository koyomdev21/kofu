import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/exceptions/app_exception.dart';
import 'package:kofu/src/features/profile/data/remote/profile_data_source.dart';
import 'package:kofu/src/features/profile/domain/language_response.dart';
import 'package:kofu/src/features/profile/domain/profile_response.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:kofu/src/utils/network_info.dart';

class ProfileRepository {
  ProfileRepository(this.ref);
  final Ref ref;

  Future<ProfileResponse> getProfile(CancelToken cancelToken) async {
    final networkInfo = ref.watch(networkInfoProvider);
    if (await networkInfo.isConnected) {
      final profileDataSource = ref.watch(profileDataSourceProvider);
      return profileDataSource.getProfile(cancelToken);
    } else {
      throw const AppException.noInternet();
    }
  }

  Future<LanguageResponse1> getLanguage() async {
    final profileDataSource = ref.watch(profileDataSourceProvider);
    final result = await profileDataSource.getLanguage();
    if (result.success!) {
      return result;
    } else {
      throw const AppException.unknownErrorHasOccurred();
    }
  }

  Future<ProfileResponse> updateProfile(
    CancelToken cancelToken,
    String username,
    String name,
    String email,
  ) async {
    final profileDataSource = ref.watch(profileDataSourceProvider);
    final networkInfo = ref.watch(networkInfoProvider);
    final permission = await ref.watch(appPreferencesProvider).getPermission();
    if (await networkInfo.isConnected) {
      final result = await profileDataSource.updateProfile(
          cancelToken, username, email, name, permission);
      if (result.success!) {
        return result;
      } else if (result.message ==
          "Plan executor error during findAndModify :: caused by :: E11000 duplicate key error collection: dev-kofo-intelligent-sales.account index: username_1 dup key: { username: \"$username\" }") {
        throw const AppException.duplicateUsername();
      } else {
        throw const AppException.unknownErrorHasOccurred();
      }
    } else {
      throw const AppException.noInternet();
    }
  }

  Future<void> logout() async {
    final profileDataSource = ref.watch(profileDataSourceProvider);

    await profileDataSource.logout();
  }
}

final profileRepositoryProvider =
    Provider.autoDispose<ProfileRepository>((ref) {
  return ProfileRepository(ref);
});
