import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'package:ultimate_tic_tac_toe/pages/app_settings.dart';
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
  bool _playerIsX = true;
  bool _highlighting = true;
  String _difDropDown = _difStart;
  int textColor = 0xffffff;

  @override
  Widget build(BuildContext context) {
    const String highlightingTrue = "Move Highlighting On";
    const String highlightingFalse = "Move Highlighting Off";

    const String playerIsXTrue = "Player X Starts";
    const String playerIsXFalse = "Player O Starts";

    return Scaffold(
      backgroundColor: Color(AppSettingState.getCurrentBackgroundColor()),
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
            const Text(
              "Settings",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Color(0xfff84434)),
            ),
            DropdownButton<String>(
                key: const Key("drop_down_button"),
                value: _difDropDown,
                style: new TextStyle(
                    color: Color(AppSettingState.getCurrentTextColor())
                ),
                dropdownColor: Color(AppSettingState.getCurrentBackgroundColor()),
                items: _difList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    key: Key(value),
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
                key: const Key("turn_button"),
                onPressed: () {
                  setState(() {
                    _playerIsX = !_playerIsX;
                  });
                },
                child: Text(_playerIsX ? playerIsXTrue : playerIsXFalse)),
            ElevatedButton(
                key: const Key("move_highlighting_button"),
                onPressed: () {
                  setState(() {
                    _highlighting = !_highlighting;
                  });
                },
                child:
                    Text(_highlighting ? highlightingTrue : highlightingFalse)),
            const Text(
              "Play",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Color(0xfff84434)),
            ),
            ElevatedButton(
                key: const Key("single_player_button"),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(
                            isSinglePlayer: true,
                            difficulty: _difDropDown,
                            highlighting: _highlighting,
                            playerTurn: _playerIsX ? TileState.X : TileState.O,
                            key: const Key("single_player")),
                      ));
                },
                child: const Text(_onePlayer)),
            ElevatedButton(
                key: const Key("two_player_button"),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(
                            isSinglePlayer: false,
                            difficulty: _difDropDown,
                            highlighting: _highlighting,
                            playerTurn: _playerIsX ? TileState.X : TileState.O,
                            key: const Key("two_player")),
                      ));
                },
                child: const Text(_twoPlayer)),
            ElevatedButton(
              key: const Key("home_button"),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
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
