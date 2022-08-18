import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final String title = 'Online Bus Ticket Booking System';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
             'alkjdfalk',
            style: TextStyle(
              fontSize: 15,

          ),
          ),
        ),
      ),
    );
  }
}