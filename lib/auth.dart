import 'package:crypt/crypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth {
  late FlutterSecureStorage storage;
  Auth() {
    storage = FlutterSecureStorage(); // 1
  }

  void setPassword(String uid, String password) {
    // 1
    String hashedPassword = Crypt.sha256(password).toString(); // 2
    storage.write(key: uid, value: hashedPassword); // 3
  }

  Future<bool> checkPassword(String uid, String password) async {
    // 1
    String? storedHashedPassword = await storage.read(key: uid); // 2
    return Future.value(Crypt(storedHashedPassword!).match(password)); // 3
  }
}
