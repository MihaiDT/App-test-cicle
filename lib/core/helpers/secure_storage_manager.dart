import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  /// Create a singleton in order to use easier FlutterSecureStorage
  SecureStorageManager._();

  static final SecureStorageManager instance = SecureStorageManager._();

  factory SecureStorageManager() {
    return instance;
  }

  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  static const _tokenKey = "accessToken";

  Future<void> saveToken(String token) async {
    await _flutterSecureStorage.write(key: _tokenKey, value: token);
  }

  Future<String> getToken() async {
    return await _flutterSecureStorage.read(key: _tokenKey) ?? "";
  }

  Future<void> clearToken() async {
    await _flutterSecureStorage.delete(key: _tokenKey);
  }
}
