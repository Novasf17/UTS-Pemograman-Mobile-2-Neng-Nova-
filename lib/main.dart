import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Nova',
      theme: ThemeData(
        brightness: Brightness.light, // <- ini wajib
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );

  }
}


