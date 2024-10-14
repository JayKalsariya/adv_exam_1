import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_exam/myroutes.dart';
import 'package:firebase_exam/services/auth_service.dart';
import 'package:firebase_exam/services/firestore_services.dart';
import 'package:firebase_exam/utils/global.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController ec = TextEditingController();
    TextEditingController pc = TextEditingController();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
// Login
              const Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
// Sign In Button
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    AuthServices.instance
                        // .signUp(email: ec.text, password: pc.text)
                        .signIn(
                            email: ec.text, password: pc.text, context: context)
                        .then((value) {
                      Navigator.pushReplacementNamed(
                        context,
                        'home',
                      );
                    });
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
                    'Sign In',
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
//Google Button
              SizedBox(
                height: 50,
                // width: 240,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    UserCredential userCredential =
                        await AuthServices.instance.signInWithGoogle();
                    User? user = userCredential.user;

                    if (user != null) {
                      await FireStoreServices.instance.getUser();
                      Navigator.pushReplacementNamed(
                        context,
                        'home',
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Continue with Google',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, MyRoutes.signup);
                    },
                    child: const Text('Sign Up',
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
