import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board_widget.dart';

import '../tiles/main_board.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  final String title = "Home";
  //final String home = "Play GamePage";
  final String settings = "Settings";
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(child: gameBoard()),
    ));
  }
}

Widget gameBoard() {
  return Builder(builder: (context) {
    final mainBoardWidth = MediaQuery.of(context).size.width;
    final mainBoardHeight = MediaQuery.of(context).size.height;
    const int boardCount = 3;
    final Board board = Board(boardCount);

    final subBoardHeight = mainBoardHeight / boardCount;
    final subBoardWidth = mainBoardWidth / boardCount;

    final children = <Widget>[];

    for (int i = 0; i < boardCount; i++) {
      final childrenRow = <Widget>[];
      for (int j = 0; j < boardCount; j++) {
        childrenRow.add(
          SubBoardWidget(
            subBoard: board.getSubBoard(i, j),
            boardWidthPixels: subBoardWidth,
            boardHeightPixels: subBoardHeight,
          ),
        );
      }
      children.add(Row(children: childrenRow));
    }

    return SizedBox(
        width: mainBoardWidth,
        height: mainBoardHeight,
        child: Column(children: children));
  });
}
