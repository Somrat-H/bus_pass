import 'package:flutter/material.dart';

class CopyPage extends StatefulWidget {
  const CopyPage({super.key});

  @override
  State<CopyPage> createState() => _CopyPageState();
}

class _CopyPageState extends State<CopyPage> {
  final textController = TextEditingController();

   String userPost = 'hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Voice Record Permission',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children:  [
                SizedBox(
                  height: 50,
                  width: 100,
              child:  Expanded(
                  child: Center(child: Text(userPost),
                  )
                ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                            hintText: 'Write what you think?',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  textController.clear();
                                },
                                icon: const Icon(Icons.clear))))),
                 Padding(padding: const EdgeInsets.all(8)   ,          
               child: MaterialButton(
                 onPressed: (){
                  setState(() {
                    userPost = textController.text;
                  });
                 },
                color: Colors.blue,
                child: const Text('Post', style: TextStyle(color: Colors.white),),
                
                ),  
                 ),   

              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: const [
                Center(
                  child: Icon(
                    Icons.mic_outlined,
                    size: 45,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: const [
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        'You need to give permission to record audio for voice typing. You can enable this permission from system settings.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 390,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade600),
                      onPressed: () {},
                      child: const Text('Go to system settings'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
