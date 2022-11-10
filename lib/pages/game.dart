import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board_widget.dart';
import '../tiles/main_board.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});
  final String title = "Home";
  //final String home = "Play GamePage";
  final String settings = "Settings";
  @override
  Widget build(BuildContext context) {
    final mainBoardWidth = MediaQuery.of(context).size.width;
    final mainBoardHeight = MediaQuery.of(context).size.height;
    MainBoard board = MainBoard(3);
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: BoardWidget(
        board: board,
        boardWidthPixels: mainBoardWidth,
        boardHeightPixels: mainBoardHeight,
      )),
    ));
  }
}
