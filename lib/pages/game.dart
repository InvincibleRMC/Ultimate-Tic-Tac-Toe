import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/main_board_widget.dart';
import '../tiles/main_board.dart';

class GamePage extends StatelessWidget {
  final bool _isSinglePlayer;
  final String _difficulty;
  final bool _highlighting;
  const GamePage(
      {bool isSinglePlayer = false,
      String difficulty = "Easy",
      bool highlighting = true,
      super.key})
      : _isSinglePlayer = isSinglePlayer,
        _difficulty = difficulty,
        _highlighting = highlighting;

  final String title = "Home";
  //final String home = "Play GamePage";
  final String settings = "Settings";
  @override
  Widget build(BuildContext context) {
    final mainBoardWidth = MediaQuery.of(context).size.width;
    final mainBoardHeight = MediaQuery.of(context).size.width;
    MainBoard board = MainBoard(_isSinglePlayer, _difficulty, 3, false);

    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: MainBoardWidget(
        board: board,
        boardWidthPixels: mainBoardWidth,
        boardHeightPixels: mainBoardHeight,
        highlighting: _highlighting,
      )),
    ));
  }
}
