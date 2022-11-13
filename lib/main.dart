import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ultimate-Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(key: Key("app")),
    );
  }
}
