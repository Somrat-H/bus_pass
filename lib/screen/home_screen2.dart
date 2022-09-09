import 'package:bus_pass/database.dart';
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
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://img.lovepik.com/free-png/20220127/lovepik-female-avatar-elements-of-womens-day-png-image_401901116_wh1200.png'),
                    ),
                  ),
                  Text(Database.instance.user!.name),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ticket Booking',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              var navigator = Navigator.of(context);
              await Database.instance.setUserLoginStatus(false);
              navigator.pushReplacement(
                MaterialPageRoute(builder: (_) => const LogIn()),
              );
            },
            child: const Text('logout'),
          ),
        ],
      ),
      body: const Text(''),
    );
  }
}
