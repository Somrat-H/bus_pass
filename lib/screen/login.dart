import 'package:bus_pass/screen/home_screen2.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        backgroundColor: Colors.white,
       body: 
      SingleChildScrollView(
        physics: const ScrollPhysics(),
       child: Column(
        children: [
          Image.asset(
            "assets/login.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8.0),
            child: Column(
              children: [
                TextFormField(
                  
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                      hintText: 'Enter Your Username', labelText: 'Username'),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    // icon: Icon(Icons.lock, ),
                      hintText: 'Enter Your Password', labelText: 'Password',
                      
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                      minimumSize: Size(100, 35)

                    ),
                  
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen2()));
                  },
                  child: const Text('Log In'),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {}, child: Text('Forgot Password')),
                const SizedBox(width: 152,),
                TextButton(onPressed: () {}, child: Text('Register')),
                
              ],
            ),
          )

        ],
        
      ),
    ),
      );
    
  }
}
