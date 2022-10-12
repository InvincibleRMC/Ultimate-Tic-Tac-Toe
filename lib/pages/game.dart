import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  final String title = "Home";
  //final String home = "Play GamePage";
  final String settings = "Settings";
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          //TODO: GamePage playing
        ),
      ),
    );
  }
}
