import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kofu/src/features/authentication/data/local/local_auth_repository.dart';
import 'package:kofu/src/features/authentication/data/local/sembast_auth_repository.dart';
import 'package:kofu/src/utils/secure_storage_provider.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kofu/src/utils/app_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:kofu/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final localAuthRepository = await SembastAuthRepository.makeDefault();
  const secureStorage = FlutterSecureStorage();
  final container = ProviderContainer(
    overrides: [
      sharedPrefsProvider.overrideWithValue(prefs),
      localAuthRepositoryProvider.overrideWithValue(localAuthRepository),
      secureStorageInstanceProvider.overrideWithValue(secureStorage),
    ],
  );
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}
