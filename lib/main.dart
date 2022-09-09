import 'package:bus_pass/database.dart';
import 'package:bus_pass/screen/home_screen2.dart';
import 'package:bus_pass/screen/login.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Database.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Database.instance.userLoginStatus
          ? const HomeScreen2()
          : const LogIn(),
    );
  }
}
