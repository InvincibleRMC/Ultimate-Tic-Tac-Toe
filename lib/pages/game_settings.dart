import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';

import 'game.dart';

class GameSettings extends StatefulWidget {
  const GameSettings({super.key});

  @override
  GameSettingSate createState() => GameSettingSate();
}

class GameSettingSate extends State<GameSettings> {
  static const String _title = "Game Settings";
  static const String _home = "Return Home";
  static const String _twoPlayer = "Two Player";
  static const String _onePlayer = "Single Player";
  static const List<String> _difList = ['Easy', 'Medium', 'Hard'];
  static const String _difStart = 'Easy';
  bool _highlighting = true;
  String _difDropDown = _difStart;

  @override
  Widget build(BuildContext context) {
    const String highlightingTrue = "Move Highlighting On";
    const String highlightingFalse = "Move Highlighting Off";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          _title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
                value: _difDropDown,
                items: _difList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _difDropDown = newValue!;
                  });
                }),
            ElevatedButton(
                key: const Key("move_highlighting_button"),
                onPressed: () {
                  setState(() {
                    _highlighting = !_highlighting;
                  });
                },
                child:
                    Text(_highlighting ? highlightingTrue : highlightingFalse)),
            ElevatedButton(
                key: const Key("single_player_button"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(
                            isSinglePlayer: true,
                            difficulty: _difDropDown,
                            key: const Key("single_player")),
                      ));
                },
                child: const Text(_onePlayer)),
            ElevatedButton(
                key: const Key("two_player_button"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(
                            isSinglePlayer: false,
                            difficulty: _difDropDown,
                            key: const Key("two_player")),
                      ));
                },
                child: const Text(_twoPlayer)),
            ElevatedButton(
              key: const Key("home_button"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              child: const Text(_home),
            ),
          ],
        ),
      ),
    );
  }
}
