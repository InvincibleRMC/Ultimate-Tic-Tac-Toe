import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';

import '../tiles/widget/main_board_widget.dart';
import 'game.dart';

class GameSettings extends StatelessWidget {
  final MainBoard menuBoard;
  const GameSettings({super.key, required this.menuBoard});
  final String _title = "Game Settings";
  final String _home = "Return Home";
  final String _twoPlayer = "Two Player";
  final String _onePlayer = "Single Player";

  @override
  Widget build(BuildContext context) {
    final mainBoardWidth = MediaQuery.of(context).size.width;
    final mainBoardHeight = MediaQuery.of(context).size.width;

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
            MainBoardWidget(
                board: menuBoard,
                boardWidthPixels: mainBoardWidth,
                boardHeightPixels: mainBoardHeight),
            ElevatedButton(
                key: const Key("single_player_button"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GamePage(
                            isSinglePlayer: true, key: Key("single_player")),
                      ));
                },
                child: Text(_onePlayer)),
            ElevatedButton(
                key: const Key("two_player_button"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GamePage(
                            isSinglePlayer: false, key: Key("two_player")),
                      ));
                },
                child: Text(_twoPlayer)),
            ElevatedButton(
              key: const Key("home_button"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
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
