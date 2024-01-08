import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  FlutterSecureStorage secureStorage;

  SecureStorageManager({
    required this.secureStorage,
  });

  static const _tokenKey = "accessToken";

  void saveToken(String token) async {
    await secureStorage.write(key: _tokenKey, value: token);
  }

  void getToken() async {
    await secureStorage.read(key: _tokenKey);
  }
}
