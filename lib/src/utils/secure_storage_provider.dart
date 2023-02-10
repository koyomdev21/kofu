import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageProvider {
  SecureStorageProvider({required this.flutterSecureStorage});
  final FlutterSecureStorage flutterSecureStorage;

  Future<void> setAccessToken(String accessToken) async {
    await flutterSecureStorage.write(key: 'accessToken', value: accessToken);
  }

  Future<void> setRefreshToken(String refreshToken) async {
    await flutterSecureStorage.write(key: 'refreshToken', value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    final result = await flutterSecureStorage.read(key: 'accessToken');
    return result;
  }

  Future<String?> getRefreshToken() async {
    final result = await flutterSecureStorage.read(key: 'refreshToken');
    return result;
  }

  Future<bool> isRefreshTokenExist() async {
    final result = await flutterSecureStorage.containsKey(key: 'refreshToken');
    return result;
  }

  Future<void> deleteAll() async {
    await flutterSecureStorage.deleteAll();
  }
}

final secureStorageProvider = Provider<SecureStorageProvider>((ref) {
  return SecureStorageProvider(
      flutterSecureStorage: ref.watch(secureStorageInstanceProvider));
});

final secureStorageInstanceProvider = Provider<FlutterSecureStorage>((ref) {
  throw UnimplementedError();
});
