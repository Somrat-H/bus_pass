import 'dart:math';

import 'package:flutter/material.dart';

class CopyPage extends StatelessWidget{
  const CopyPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Voice Record Permission', 
        style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          const SizedBox(
          height: 170,
          ),
          Column(
            children: const [
                  Center(
                  child: Icon(Icons.mic_outlined, size: 45,),
                )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: const [
              
              Center(
                child: Text('You need to give permission to record audio for voice typing. You can enable this permission from system settings.'),
              )
            ],
          ),
          Column(
            children: [
              Center(
                
                child: 
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600),
                  onPressed: (){},
                  child: const Text('Go to system settings'), ),
              )
            ],
          )

        ],
      ),
    );
  }
}