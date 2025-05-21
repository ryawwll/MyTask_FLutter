import 'package:hive_flutter/hive_flutter.dart';

class LocalStrorage {
  Box _userBox = Hive.box('user');

  /// Initialize Hive and open the user box
  
  getName() {
    _userBox = Hive.box('user');
  }

  /// Save user data to local storage
  void saveToken(String token) {
    _userBox.put('token', token);
  }

  /// Get user data from local storage
  String? getToken() {
    return _userBox.get('token');
  }

  /// Check if user data exists in local storage
  deleteToken() {
    _userBox.delete('token');
  }
}
