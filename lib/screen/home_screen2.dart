import 'package:bus_pass/screen/login.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final String t = 'Online Bus Ticket Booking System';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(),
      ),
      appBar: AppBar(
        
        title: const Center(
          child:  Text('Ticket Booking',
            style: TextStyle(
              fontSize: 15,

          ),
          ),
        ),
      ),
      body: const Text(''),
    );
  }
}