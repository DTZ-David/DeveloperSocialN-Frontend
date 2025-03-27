import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  late SharedPreferences _storage;

  StorageService._internal();

  factory StorageService() {
    return _instance;
  }

  static Future<void> init() async {
    _instance._storage = await SharedPreferences.getInstance();
  }

  Future<void> write(String key, String value) async {
    await _storage.setString(key, value);
  }

  Future<String?> read(String key) async {
    return _storage.getString(key);
  }

  Future<void> delete(String key) async {
    await _storage.remove(key);
  }
}
