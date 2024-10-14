import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_exam/myroutes.dart';
import 'package:firebase_exam/services/auth_service.dart';
import 'package:firebase_exam/services/firestore_services.dart';
import 'package:firebase_exam/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController ec = TextEditingController();
    TextEditingController pc = TextEditingController();
    TextEditingController cpc = TextEditingController();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome
              const Text(
                'WelCome',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Username
              TextFormField(
                controller: Global.nc,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Email
              TextFormField(
                controller: ec,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Password
              TextFormField(
                obscureText: true,
                obscuringCharacter: '*',
                controller: pc,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.security),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Confirm Password
              TextFormField(
                obscureText: true,
                obscuringCharacter: '*',
                controller: cpc,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.security),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Sign Up Button
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    AuthServices.instance
                        .signUp(email: ec.text, password: pc.text)
                        .then((value) {
                      Navigator.pushReplacementNamed(
                        context,
                        'home',
                      );
                    });
                    Logger().i('Button Pressed');
                    if (pc.text == cpc.text) {
                      User? user = await AuthServices.instance.signUp(
                        email: ec.text,
                        password: pc.text,
                      );
                      if (user != null) {
                        await FireStoreServices.instance.addUser(user: user);
                        // await FireStoreServices.instance.getUser();
                        Navigator.pushReplacementNamed(context, MyRoutes.home);
                      }
                    } else if (Global.nc.text.isEmpty ||
                        ec.text.isEmpty ||
                        pc.text.isEmpty ||
                        cpc.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('All fields are required'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Passwords do not match'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.grey.shade500),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Global.isTrue ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Or'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.login);
                    },
                    child: const Text('Sign In',
                        style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
