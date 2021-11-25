import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterStorage {
  static final storage = FlutterSecureStorage();

  static writeJWTToken(token) {
    return storage.write(key: 'token', value: token);
  }

  static readJWTToken() {
    return storage.read(key: 'token');
  }

  static clearStorage() {
    return storage.deleteAll();
  }
}
