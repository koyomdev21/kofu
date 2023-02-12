// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class GoRouterNotifier extends ChangeNotifier {
//   bool _isLoggedIn = false;
// bool get isLoggedIn => _isLoggedIn;
// set setLoggedIn(bool value) {
//   _isLoggedIn = value;
//   notifyListeners();
// }
// }

// final goRouterNotifierProvider = Provider<GoRouterNotifier>((ref) {
//   return GoRouterNotifier();
// });

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences extends ChangeNotifier {
  AppPreferences({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  Future<void> setLoggedIn() async {
    await sharedPreferences.setBool('logged_in', true);
    notifyListeners();
  }

  Future<void> setUsername(String username) async {
    await sharedPreferences.setString('username', username);
  }

  Future<void> setPassword(String password) async {
    await sharedPreferences.setString('password', password);
  }

  Future<void> setRemember(bool value) async {
    await sharedPreferences.setBool('remember_me', value);
  }

  Future<void> setUserId(String value) async {
    await sharedPreferences.setString('user_id', value);
  }

  Future<String> getUsername() async {
    final username = sharedPreferences.getString('username');
    return username ?? '';
  }

  Future<String> getUserId() async {
    final userId = sharedPreferences.getString('user_id');
    return userId ?? '';
  }

  Future<String> getPassword() async {
    final password = sharedPreferences.getString('password');
    return password ?? '';
  }

  Future<bool> getRemember() async {
    final password = sharedPreferences.getBool('remember_me');
    return password ?? false;
  }

  Future<bool> isLoggedIn() async {
    return sharedPreferences.getBool('logged_in') ?? false;
  }

  Future<void> setPermission(List<String> permission) async {
    await sharedPreferences.setStringList('permission', permission);
  }

  Future<List<String>> getPermission() async {
    return sharedPreferences.getStringList('permission') ?? [];
  }

  Future<String> getAppLanguage() async {
    String? language = sharedPreferences.getString('language');

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return 'en';
    }
  }

  Future<void> setLanguageChanged(String? lang) async {
    String currentLanguage = await getAppLanguage();

    sharedPreferences.setString('language', lang!);
  }

  Future<Locale> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == 'zh') {
      // return chinese local
      return const Locale("zh", "HK");
    } else {
      // return english local
      return const Locale("en", "US");
    }
  }

  Future<void> logout() async {
    sharedPreferences.remove('logged_in');
    sharedPreferences.remove('user_id');
    notifyListeners();
  }
}

final appPreferencesProvider = Provider<AppPreferences>((ref) {
  return AppPreferences(sharedPreferences: ref.watch(sharedPrefsProvider));
});

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
