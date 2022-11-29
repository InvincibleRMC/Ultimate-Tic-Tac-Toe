import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/main_board_widget.dart';
import 'package:ultimate_tic_tac_toe/pages/app_settings.dart';
import '../tiles/main_board.dart';
import '../tiles/tile_state.dart';

class GamePage extends StatelessWidget {
  final bool _isSinglePlayer;
  final String _difficulty;
  final bool _highlighting;
  final TileState _playerTurn;
  const GamePage(
      {bool isSinglePlayer = false,
      String difficulty = "Easy",
      bool highlighting = true,
      TileState playerTurn = TileState.X,
      super.key})
      : _isSinglePlayer = isSinglePlayer,
        _difficulty = difficulty,
        _highlighting = highlighting,
        _playerTurn = playerTurn;

  final String title = "Home";
  final String settings = "Settings";
  @override
  Widget build(BuildContext context) {
    final double mainBoardSize = min(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    MainBoard board = MainBoard(
        isSinglePlayer: _isSinglePlayer,
        difficulty: _difficulty,
        size: 3,
        startingTurn: _playerTurn);

    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(AppSettingState.getCurrentBackgroundColor()),
      body: Center(
          child: MainBoardWidget(
        board: board,
        boardSizePixels: mainBoardSize,
        highlighting: _highlighting,
      )),
    ));
  }
}
