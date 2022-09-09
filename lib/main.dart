import 'package:bus_pass/screen/login.dart';
import 'package:flutter/material.dart';


void main() => runApp( const MyApp());


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return   MaterialApp(
      // theme: ThemeData(
      //   primaryColor: Colors.red,
      //     colorSchemeSeed: Colors.red,
      //     useMaterial3: true,
      //   ),
      debugShowCheckedModeBanner: true,
      home: LogIn(t1: 'mainname', t2: 'mainpass',)
      // routes: {
      //   MyRoutes.homeRoutes:(context) =>   const HomeScreen2(),
      //   MyRoutes.loginRoutes:(context) =>  const LogIn(),
      //   MyRoutes.registerRoutes:(context) =>  const Register(),

      // },

    );
  }
}