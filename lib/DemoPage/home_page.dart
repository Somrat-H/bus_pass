import 'package:flutter/material.dart';

import 'copy_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool iconBool = false;

  final IconData iconLight = Icons.wb_sunny;
  final IconData iconDark = Icons.nights_stay;

  final ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
  );

  final ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: iconBool ? themeDark : themeLight,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade600,
          title: const Center(
            child: Text(
              'Online Bus Ticket Booking System',
            ),
          ),
        ),
        body: Column(
          children: [
            IconButton(
              icon: Icon(iconBool ? iconLight : iconDark),
              onPressed: () {
                setState(() {
                  iconBool = !iconBool;
                });
              },
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  height: 65,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CopyPage(),
                        ),
                      );
                    },
<<<<<<< HEAD:lib/home_page.dart
                    child: const Text(
                      'Next Page',
                    ),
=======
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 65,
                    width: 300,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CopyPage()));
                        },
                        child: const Text(
                          'Next Page',
                        )),
>>>>>>> b925fc243c39e169bf31a0822a278b6dec297130:lib/DemoPage/home_page.dart
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}