import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefs {
  Future<bool?> saveString({required String key, required String value});
  T? get<T>({required String key});
  Future<bool> remove({required String key});
}

class SharedPrefsImpl implements SharedPrefs {
  final SharedPreferences _sharedPreferences;

  SharedPrefsImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<bool?> saveString({required String key, required String value}) async {
    return await _sharedPreferences.setString(key, value);
  }

  @override
  T? get<T>({required String key}) {
    try {
      final res = _sharedPreferences.get(key) as T;
      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> remove({required String key}) async {
    return await _sharedPreferences.remove(key);
  }
}
