import 'package:bus_pass/database.dart';
import 'package:bus_pass/screen/home_screen2.dart';
import 'package:bus_pass/screen/login.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.init();
  runApp(const MyApp());
}
// haha wait it will keep loged in until user logs out again, got it?
// yes i got it but i have question?
// sure?

// how can manage all data ?
// great question. if the data is public then we should use firebase database. 
// here ticket quality price etc are public data. but for now we are gonna use shared preference as data
// base . since it's local. then later you can implement those easily into firebase. so now try to understand 
// how shared preference used. it is veruy very important than cloud database. most of the data need to store localy 
// so go on and knock me if don't understand any thing. Okay?
// yes oky but i say about thi share preference.
// we can store user data in two types local and cloud? yes. AND most better is local. because it is more secure, faster, and prefered.
// ok, but i have a another question?sure>?
// when a passenger book a ticket then our backend work with thread?
// as for your information, there is no thread in dart.
// so what are we use for booking the ticket?
// it's asynchonous language which handles everything as an event by a single thread. so we can do all backend works just uing future.
// let me show you something.. right  now?>
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
      home: Database.instance.user != null
          ? const HomeScreen2()
          : const LogIn(),
    );
  }
}
