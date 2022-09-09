import 'package:bus_pass/database.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({
    super.key,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    hintText: 'Enter Your Full Name',
                    labelText: 'Full Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Need a full name!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    hintText: 'Enter Yoiur Username',
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Need at least 6 character username!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.key_rounded),
                    hintText: 'Enter Your Password',
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Need at least 6 character password!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.key_rounded),
                    hintText: 'Re-Enter Your Password',
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'password didn\'t matched!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () async {
                    var messanger = ScaffoldMessenger.of(context);
                    var navigator = Navigator.of(context);
                    if (formKey.currentState!.validate()) {
                      await Database.instance.addUser(
                        username: usernameController.text,
                        password: passwordController.text,
                        fullName: fullNameController.text,
                      );
                    messanger.showSnackBar(
                      const SnackBar(
                        content: Text(
                          'User registerd. You can login now.',
                        ),
                      ),
                    );
                    navigator.pop();
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
