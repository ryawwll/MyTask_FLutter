import 'package:hive_flutter/hive_flutter.dart';

class LocalStrorage {
  static late Box _userBox;


  /// Initialize Hive and open the user box
  static Future<void> init() async {
    await Hive.initFlutter();
    _userBox = await Hive.openBox('user');
  }

  /// Save user data to local storage
  static void saveToken(String token)  {
     _userBox.put('token', token);
  }

  /// Get user data from local storage
  static String? getToken() {
    return _userBox.get('token');
  }

  /// Check if user data exists in local storage
  static void deleteToken() {
    _userBox.delete('token');
  }
}