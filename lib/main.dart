import 'package:bus_pass/screen/home_screen2.dart';
import 'package:bus_pass/screen/login.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: LogIn(),
    );
  }
}