// import 'package:shared_preferences/shared_preferences.dart';

// class SpHelper {
//   static Future<String?> getString(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(key);
//   }

//   static Future<List<String>> getStringList(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList(key) ?? [];
//   }

//   static Future<int?> getInt(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(key);
//   }

//   static Future<bool?> getBool(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(key);
//   }

//   static Future<double?> getDouble(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getDouble(key);
//   }

//   static Future setString(String key, String value) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setString(key, value);
//   }

//   static Future setStringList(String key, List<String>? value) async {
//     if (value == null || value.isEmpty) return;
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setStringList(key, value);
//   }

//   static Future setInt(String key, int value) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setInt(key, value);
//   }

//   static Future setBool(String key, bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setBool(key, value);
//   }

//   static Future setDouble(String key, double value) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setDouble(key, value);
//   }

//   static Future<void> removeKey(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(key);
//   }

//   static Future clear() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }
