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

  Future<bool> saveUserLoginStatus({String? username, String? password}) async {
    if (username == null) {
      return deleteUser();
    }
    var users = usersString.map((e) => User.fromJson(jsonDecode(e))).toList();
    User? user;
    try {
      user = users.firstWhere((element) =>
          element.username == username && element.password == password);
    } catch (e) {
      return false;
    }
    return _preferences.setString('user', jsonEncode(user));
  }

  List<String> get usersString => _preferences.getStringList('users') ?? [];

  Future<bool> addUser({
    required String username,
    required String password,
    required String fullName,
  }) async {
    assert(username.isNotEmpty, 'name can\'t be empty');
    assert(password.isNotEmpty, 'id can\'t be empty');
    var users = usersString.map((e) => User.fromJson(jsonDecode(e))).toList();
    if (users.any((element) => element.username == username)) {
      return false;
    }
    users.add(User(username, password, fullName));
    return _preferences.setStringList(
        'users', users.map((e) => jsonEncode(e.toJson())).toList());
  }

  Future<bool> deleteUser() {
    return _preferences.remove('user');
  }

  Future<bool> updateTicketNumber(int number, bool booked) {
    var tickets = (_preferences.getStringList(user!.username) ?? [])
        .map((e) => int.parse(e))
        .toList();
    if (booked) {
      assert(!tickets.contains(number));
      tickets.add(number);
    } else {
      assert(tickets.contains(number));
      tickets.remove(number);
    }
    return _preferences.setStringList(
      user!.username,
      tickets.map((e) => '$e').toList(),
    );
  }

  bool isMyTicketNumber(int number) {
    var tickets = (_preferences.getStringList(user!.username) ?? [])
        .map((e) => int.parse(e))
        .toList();
    return tickets.contains(number);
  }

  Future<bool> saveTicketSatus(int ticketNumber, bool booked) async {
    var busData = bus;
    busData.tickets[ticketNumber].booked = booked;
    await updateTicketNumber(ticketNumber, booked);
    return _preferences.setString('bus', busData.toData());
  }

  Bus get bus => Bus(_preferences.getString('bus'));
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

class Ticket {
  int seatNumber;
  bool booked = false;
  Ticket(this.seatNumber);
  Ticket.fromJson(Map<String, dynamic> json)
      : seatNumber = json['seatNumber'],
        booked = json['booked'];
  Map<String, dynamic> toJson() => {
        'seatNumber': seatNumber,
        'booked': booked,
      };
}

class Bus {
  late List<Ticket> tickets;
  Bus(String? data) {
    if (data == null) {
      tickets = List.generate(40, (index) => Ticket(index));
    } else {
      tickets = (jsonDecode(data)['tickets'] as List)
          .map((e) => Ticket.fromJson(e))
          .toList();
    }
  }

  String toData() {
    return jsonEncode({
      'tickets': tickets.map((e) => e.toJson()).toList(),
    });
  }
}
