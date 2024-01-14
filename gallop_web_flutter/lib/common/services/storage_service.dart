import 'package:shared_preferences/shared_preferences.dart';

/// 程序持久化存储服务
class StorageService {

  StorageService._internal();
  factory StorageService() => _instance;
  static final StorageService _instance = StorageService._internal();

  late final SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void put(String key, String value) {
    _prefs.setString(key, value);
  }

  String? get(dynamic key) {
    return _prefs.getString(key);
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

}