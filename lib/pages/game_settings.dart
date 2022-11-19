import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';

import 'game.dart';

class GameSettings extends StatelessWidget {
  const GameSettings({super.key});
  final String _title = "Game Settings";
  final String _home = "Return Home";
  final String _twoPlayer = "Two Player";
  final String _onePlayer = "Single Player";

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
                key: const Key("single_player"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const GamePage(isSinglePlayer: true),
                      ));
                },
                child: Text(_onePlayer)),
            ElevatedButton(
                key: const Key("two_player"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const GamePage(isSinglePlayer: false),
                      ));
                },
                child: Text(_twoPlayer)),
            ElevatedButton(
              key: const Key("home_button"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              child: Text(_home),
            ),
          ],
        ),
      ),
    );
  }
}
