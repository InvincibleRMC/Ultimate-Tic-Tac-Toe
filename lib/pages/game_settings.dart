import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';

import 'game.dart';

class GameSettings extends StatefulWidget {
  const GameSettings({super.key});
  final String title = "Game Settings";
  final String home = "Return Home";
  final String game = "Start Game";
  @override
  State<GameSettings> createState() => _GameSettingsState();
}

class _GameSettingsState extends State<GameSettings> {
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
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              child: Text(widget.home),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GamePage(),
                      ));
                },
                child: Text(widget.game))
          ],
        ),
      ),
    );
  }
}
