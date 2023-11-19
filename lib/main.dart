import 'package:flutter/material.dart';
import 'package:news_incl/view/home.dart';
import 'package:news_incl/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News InCl',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

