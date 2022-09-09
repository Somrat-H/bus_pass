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

  bool get userLoginStatus => _preferences.getBool('status') ?? false;

  Future<bool> setUserLoginStatus(bool status) {
    return _preferences.setBool('status', status);
  }

  Future<bool> addUser({
    required String username,
    required String password,
    required String fullName,
  }) {
    assert(username.isNotEmpty, 'name can\'t be empty');
    assert(password.isNotEmpty, 'id can\'t be empty');
    return _preferences.setString(
      'user',
      jsonEncode(User(username, password, fullName)),
    );
  }

  Future<bool> deleteUser() {
    return _preferences.remove('user');
  }
}

class User {
  String name;
  String username;
  String password;

  User(this.username, this.password, this.name);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'name': name,
      };

  bool validate(String username, String password) {
    return username == this.username && password == this.password;
  }
}

extension NullCheck on dynamic {
  bool get isNull {
    return this == null;
  }
}
