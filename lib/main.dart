import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_exam/firebase_options.dart';
import 'package:firebase_exam/myapp.dart';
import 'package:firebase_exam/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
