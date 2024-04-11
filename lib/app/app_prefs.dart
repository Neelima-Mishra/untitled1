import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyPopularData = "PREFS_KEY_POPULAR_DATA";

class AppPrefs {
  final SharedPreferences _sharedPreferences;

  AppPrefs(this._sharedPreferences);

  Future<void> setPrefStringValue(String key, value) async {
    _sharedPreferences.setString(key, value);
  }

  Future<String> getPrefStringValue(String key) async {
    return _sharedPreferences.getString(key) ?? "";
  }

  Future<void> setPrefIntValue(String key, value) async {
    _sharedPreferences.setInt(key, value);
  }

  Future<int> getPrefIntValue(String key) async {
    return _sharedPreferences.getInt(key) ?? 0;
  }

  Future<void> setPrefBoolValue(String key, value) async {
    _sharedPreferences.setBool(key, value);
  }

  Future<bool?> getPrefBoolValue(String key) async {
    return _sharedPreferences.getBool(key);
  }

  Future<void> setPrefDoubleValue(String key, value) async {
    _sharedPreferences.setDouble(key, value);
  }

  Future<double> getPrefDoubleValue(String key) async {
    return _sharedPreferences.getDouble(key) ?? 0.0;
  }

  removePrefValue(String key) async {
    return _sharedPreferences.remove(key);
  }

  deleteAccountPrefValue() async {
    return _sharedPreferences.clear();
  }
}
