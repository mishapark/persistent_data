import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  static const creditCard = "CREDIT_CARD";

  static String _getUserCardKey(int id) => "$creditCard/$id";

  static Future<void> saveCardNumber(int id, String card) async {
    await _storage.write(key: _getUserCardKey(id), value: card);
  }

  static Future<String?> getCardNumber(int id) async {
    return await _storage.read(key: _getUserCardKey(id));
  }

  static Future<void> removeCardNumber(int id) async {
    await _storage.delete(key: _getUserCardKey(id));
  }
}
