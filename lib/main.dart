import 'package:bus_pass/screen/home_screen2.dart';
import 'package:bus_pass/screen/login.dart';
import 'package:bus_pass/utils/routes.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());


class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: "/",
      routes: {
        "/":(context) => const HomeScreen2(),
        MyRoutes.homeRoutes:(context) => const HomeScreen2(),
        MyRoutes.loginRoutes:(context) => const LogIn(),
      },

    );
  }
}