import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';

import 'game.dart';

class GameSettings extends StatelessWidget {
  const GameSettings({super.key});
  final String _title = "Game Settings";
  final String _home = "Return Home";
  final String _game = "Start Game";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _title,
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
              child: Text(_home),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GamePage(),
                      ));
                },
                child: Text(_game))
          ],
        ),
      ),
    );
  }
}
