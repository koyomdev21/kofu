import 'package:kofu/src/features/authentication/signin/domain/sign_in_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'package:kofu/src/features/authentication/data/local/local_auth_repository.dart';

class SembastAuthRepository implements LocalAuthRepository {
  SembastAuthRepository(this.db);
  final Database db;
  final store = StoreRef.main();

  static Future<Database> createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase('${appDocDir.path}/$filename');
  }

  static Future<SembastAuthRepository> makeDefault() async {
    return SembastAuthRepository(await createDatabase('default.db'));
  }

  static const authItemsKey = 'authItems';

  @override
  Future<SignInResponse?> fetchUser() async {
    final authJson =
        await store.record(authItemsKey).get(db) as Map<String, dynamic>?;
    if (authJson != null) {
      return SignInResponse.fromJson(authJson);
    } else {
      return null;
    }
  }

  @override
  Future<void> setUser(SignInResponse signInResponse) {
    return store.record(authItemsKey).put(db, signInResponse.toJson());
  }
}
