import "../export/package_exports.dart";

class SharedPrefService {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  Future<bool?>? setToken(String token) async {
    return await _prefsInstance?.setString(PrefKey.token.name, token);
  }

  String getToken() => _prefsInstance?.getString(PrefKey.token.name) ?? "";
}

enum PrefKey {
  token,
}
