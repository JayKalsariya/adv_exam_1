import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation controller for controlling the fade-in effect
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the animation from 0.0 to 1.0
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Animation listener to detect when the animation completes
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the Login Page after the animation completes
        Navigator.pushReplacementNamed(
            context, 'login'); // Update 'login' with the actual route name
      }
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Replace with your own logo asset
              Image.asset(
                'assets/logo.png', // Make sure you have this logo image in your assets folder
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
