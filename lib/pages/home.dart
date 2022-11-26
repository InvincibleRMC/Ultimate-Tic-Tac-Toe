import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/app_settings.dart';

import '../tiles/main_board.dart';
import '../tiles/widget/main_board_widget.dart';
import 'game_settings.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final String _title = "Home";
  final String _gameSettings = "Play Game";
  final String _settings = "Settings";
  final MainBoard menuBoard = MainBoard(false, "Easy", 3, true);

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
                boardHeightPixels: mainBoardHeight,
                highlighting: true),
            ElevatedButton(
              key: const Key("game_settings_button"),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const GameSettings(key: Key("game_settings")),
                    ));
              },
              child: Text(_gameSettings),
            ),
            ElevatedButton(
                key: const Key("app_settings_button"),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AppSettings(key: Key("app_settings")),
                      ));
                },
                child: Text(_settings))
          ],
        ),
      ),
    );
  }
}
