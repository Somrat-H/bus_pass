import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Database {
  final SharedPreferences _preferences;
  Database._(this._preferences);

  static late final Database _instance;
  static Future<void> init() async {
    _instance = Database._(await SharedPreferences.getInstance());
  }

  static Database get instance => _instance;

  User? get user {
    final String? userJson = _preferences.getString('user');
    return userJson.isNull ? null : User.fromJson(jsonDecode(userJson!));
  }

  Future<bool> login({required String userName, required String password}) {
    assert(userName.isNotEmpty, 'name can\'t be empty');
    assert(password.isNotEmpty, 'id can\'t be empty');
    return _preferences.setString('user', jsonEncode(User(userName, password)));
  }

  Future<bool> logout() {
    return _preferences.remove('user');
  }
}

class User {
  String userName;
  String password;

  User([this.userName = '', this.password = '']);

  User.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'password': password,
      };
}

extension NullCheck on dynamic {
  bool get isNull {
    return this == null;
  }
}