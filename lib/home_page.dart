import 'package:flutter/material.dart';

import 'copy_page.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.green.shade600,
        title: const Center(
          child: Text('Online Bus Ticket Booking System',),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 65,
          width: 300,
       child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade600),
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context) => CopyPage()));
         },
      
        child: const Text('Next Page',),

       ),
      ),
    ),
    );
  }
}