import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/features/profile/data/remote/profile_data_source.dart';
import 'package:kofu/src/features/profile/domain/profile_response.dart';

class ProfileRepository {
  ProfileRepository(this.ref);
  final Ref ref;

  Future<ProfileResponse> getProfile(CancelToken cancelToken) async {
    final profileDataSource = ref.watch(profileDataSourceProvider);
    return profileDataSource.getProfile(cancelToken);
  }

  Future<void> logout() async {
    final profileDataSource = ref.watch(profileDataSourceProvider);

    await profileDataSource.logout();
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref);
});
