// ignore_for_file: must_be_immutable

import 'package:bus_pass/screen/home_screen2.dart';
import 'package:bus_pass/screen/register.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  String? t1, t2;
  LogIn({super.key, this.t1, this.t2});

  @override
  State<LogIn> createState() => LogInState();
}

class LogInState extends State<LogIn> {
  String username = '';
  String password = '';
  // String t1, t2;
  final textcon = TextEditingController();
  final textcon2 = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  moveTohome(BuildContext context) {
    if (_formkey.currentState!.validate() &&
        widget.t1 == username &&
        widget.t2 == password) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeScreen2()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Image.asset(
              "assets/login.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: textcon,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          hintText: 'Enter Your Username',
                          labelText: 'Username'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: textcon2,
                      obscureText: true,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.key),
                        // icon: Icon(Icons.lock, ),
                        hintText: 'Enter Your Password', labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty";
                        } else if (value.length < 8) {
                          return "Password shuld be 8";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        minimumSize: const Size(100, 35)),
                    onPressed: () {
                      setState(() {
                        username = textcon.text;
                        password = textcon2.text;
                      });
                      moveTohome(context);
                    },
                    child: const Text('Log In'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {}, child: const Text('Forgot Password')),
                  const SizedBox(
                    width: 150,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()));
                      },
                      child: const Text('Register')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
