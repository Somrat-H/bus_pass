import 'package:bus_pass/utils/routes.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String user = '';
  final textcon = TextEditingController();
  final _formkey = GlobalKey<FormState>();

 moveTohome(BuildContext context){
  if(_formkey.currentState!.validate()){
      Navigator.pushNamed(context, MyRoutes.homeRoutes);
  }
 }
 
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
            child: Form(
              key: _formkey,

              child:
            Column(
              children: [
                TextFormField(
                 
                    controller: textcon,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                      hintText: 'Enter Your Username', labelText: 'Username'),
                       validator: (value){
                    if(value!.isEmpty){
                      return "Username can't be empty";
                    }
                    return  null;
                  },

                ),
                TextFormField(
                
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    // icon: Icon(Icons.lock, ),
                      hintText: 'Enter Your Password', labelText: 'Password',
                      
                      ),
                        validator: (value) {
                    if(value!.isEmpty){
                      return "Password can't be empty";
                    }
                    else if(value.length < 8){
                      return "Password shuld be 8";
                    }
                    return null;
                  },
                ),
              ],

            ),
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
                      minimumSize: const Size(100, 35)

                    ),
                  
                  onPressed: () {
                   moveTohome(context);
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
                TextButton(onPressed: () {}, child: Text(user)),
                
              ],
            ),
          )

        ],
        
      ),
    ),
      );
    
  }
}
