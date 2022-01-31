import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN_KEY = 'user_token_v1';
const String REFRESH_TOKEN_KEY = 'user_refresh_token_v1';


class StorageManager {
  static Future<SharedPreferences> get _instance async => _prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefs;

  // call this method from initState() function of mainApp.
  static Future<SharedPreferences> initPrefs() async {
    _prefs = await _instance;
    return _prefs;
  }

  static String getString(String key, [String defValue]) {
    return _prefs.getString(key) ?? defValue ?? "";
  }

  /// Returns user token
  ///
  /// Default value is null except you point [defValue] parameter
  static String getToken([String defValue]) {
    return _prefs.getString(TOKEN_KEY) ?? defValue ?? null;
  }

  /// Returns if user authenticated or not
  ///
  /// return token == null || token == '';
   
  static bool get auth {
    String token = _prefs.getString('usertoken');
    return token != null && token != '';
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value) ?? Future.value(false);
  }

  static bool getBool(String key, [String defValue]) {
    return _prefs.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs?.setBool(key, value) ?? Future.value(false);
  }

  static Future<bool> isKeyExist(String key) async {
    var prefs = await _instance;
    return prefs.containsKey(key);
  }

  static Future<void> clearAuth() async {
    var prefs = await _instance;
    prefs.remove('usertoken');
    return;
  }

  // static Future<bool> setToken(String value, {String refreshToken}) async {
  //   var prefs = await _instance;
  //   if (refreshToken != null) await prefs?.setString(REFRESH_TOKEN_KEY, refreshToken) ?? Future.value(false);
  //   return prefs?.setString(TOKEN_KEY, value) ?? Future.value(false);
  // }

  // static Future<StoreTokenModel> getParsedToken() async {
  //   var prefs = await _instance;
  //   final String token = prefs.getString(TOKEN_KEY);
  //   return StoreTokenModel.fromJson(parseJwt(token));
  // }

  static void clearAll() {
    _prefs.clear();
  }
}
