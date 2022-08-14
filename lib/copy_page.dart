
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
          height: 200,
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
              Padding(padding: EdgeInsets.all(8),
              child: Center(
                child: Text('You need to give permission to record audio for voice typing. You can enable this permission from system settings.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                ),
                textAlign: TextAlign.center,
                ),
              )
              )
            ],
          ),
          const SizedBox(
            height: 150,
          ),
          Column(
            children: [
              Center(
                child: SizedBox(
                  height: 60,
                  width: 390,
                  
               child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600),
                  onPressed: (){},
                  child: const Text('Go to system settings'), 
                  ),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}