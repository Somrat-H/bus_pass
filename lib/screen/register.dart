import 'package:bus_pass/screen/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  
  const Register({super.key,});
  
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String username = 'abs';
  String password = '12345678';

  final nameCon = TextEditingController();
  final passCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8.0),
          child: Column(
            children: [
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                      hintText: 'Enter Your Full Name', labelText: 'Full Name'),
                  ),
                  TextFormField(
                    controller: nameCon,
                    decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                      hintText: 'Enter Yoiur Username', labelText: 'Username'),
                  ),
                  TextFormField(
                    controller: passCon,
                    decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.key_rounded),
                      hintText: 'Enter Your Password', labelText: 'Password'),
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.key_rounded),
                      hintText: 'Re-Enter Your Password', labelText: 'Password'),
                  ),
                  const SizedBox(height: 20,),

                  MaterialButton(
                    color: Colors.blue,
                    onPressed: (){
                      setState(() {
                        username = nameCon.text;
                        password = passCon.text;
                      });
                      Navigator.push(context, MaterialPageRoute(builder:
                       (context)=> LogIn(t1: nameCon.text, t2: passCon.text,)));
                    },
                    child: const Text('Register'),
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
      
    
    );
  }
}