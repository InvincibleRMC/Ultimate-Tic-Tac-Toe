import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/subBoard.dart';

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
    final subBoardHeight = mainBoardHeight / 3;
    final subBoardWidth = mainBoardWidth / 3;
    const int boardCount = 3;
    final children = <Widget>[];

    for (int i = 0; i < boardCount; i++) {
      final childrenRow = <Widget>[];
      for (int j = 0; j < boardCount; j++) {
        childrenRow.add(
          SubBoard(
            boardWidth: subBoardWidth,
            boardHeight: subBoardHeight,
            boardNum: i * boardCount + j,
          ),
        );
      }
      children.add(Row(children: childrenRow));
    }

    return Container(
        width: mainBoardWidth,
        height: mainBoardHeight,
        child: Column(children: children));
  });
}
