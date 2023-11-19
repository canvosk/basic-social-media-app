import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  late SharedPreferences _preferences;

  // Singleton için factory constructor
  factory LocalStorageService() {
    _instance ??= _instance = LocalStorageService._();
    return _instance!;
  }

  LocalStorageService._();

  // SharedPreferences'ı başlatma metodu
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<String> getString({required String key}) async {
    return _preferences.getString(key) ?? "";
  }

  Future<bool> setString({required String key, required String value}) async {
    return _preferences.setString(key, value);
  }

  Future<bool> removeValue({required String key}) async {
    return _preferences.remove(key);
  }
}
