import 'package:bus_pass/screen/home_screen2.dart';
import 'package:bus_pass/screen/login.dart';
import 'package:bus_pass/screen/register.dart';
import 'package:bus_pass/utils/routes.dart';
import 'package:flutter/material.dart';


void main() => runApp( MyApp());


<<<<<<< HEAD
class MyApp extends StatelessWidget{
  const MyApp({super.key});
=======
class MyApp extends StatefulWidget{
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    String mainname="abs";
    String mainpass="12345678";
>>>>>>> b925fc243c39e169bf31a0822a278b6dec297130
  @override
  Widget build(BuildContext context){
    return   MaterialApp(
      // theme: ThemeData(
      //   primaryColor: Colors.red,
      //     colorSchemeSeed: Colors.red,
      //     useMaterial3: true,
      //   ),
      debugShowCheckedModeBanner: true,
      home: LogIn(t1: mainname, t2: mainpass,)
      // routes: {
      //   MyRoutes.homeRoutes:(context) =>   const HomeScreen2(),
      //   MyRoutes.loginRoutes:(context) =>  const LogIn(),
      //   MyRoutes.registerRoutes:(context) =>  const Register(),

      // },

    );
  }
}