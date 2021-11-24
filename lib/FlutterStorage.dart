import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterStorage {
  static final storage = FlutterSecureStorage();

  static writeJWTToken(token) async {
    await storage.write(key: 'token', value: token);
  }

  static readJWTToken() async {
    return await storage.read(key: 'token');
  }
}
