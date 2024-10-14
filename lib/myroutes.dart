import 'package:firebase_exam/layouts/cartpage/cart_page.dart';
import 'package:firebase_exam/layouts/homepage/home_page.dart';
import 'package:firebase_exam/layouts/loginpage/login_page.dart';
import 'package:firebase_exam/layouts/signuppage/signup_page.dart';
import 'package:firebase_exam/layouts/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static const String splash = '/';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String home = 'home';
  static const String cart = 'cart';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashScreen(),
    login: (context) => const LoginPage(),
    home: (context) => const HomePage(),
    signup: (context) => const SignUpPage(),
    cart: (context) => CartPage(),
  };
}
