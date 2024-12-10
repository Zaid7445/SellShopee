import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static final _storage = FlutterSecureStorage();
  static const _accessTokenKey = 'access_token';

  // Get the access token
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  // Set the access token
  static Future<void> setAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  // Delete the access token
  static Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  // Check if the token exists
  static Future<bool> hasAccessToken() async {
    final token = await getAccessToken();
    return token != null;
  }
}
