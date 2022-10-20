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

    return Container(
        width: mainBoardWidth,
        height: mainBoardHeight,
        child: Column(
          children: [
            Row(
              children: [
                SubBoard(
                  boardWidth: subBoardWidth,
                  boardHeight: subBoardHeight,
                  boardNum: 0,
                ),
                SubBoard(
                    boardWidth: subBoardWidth,
                    boardHeight: subBoardHeight,
                    boardNum: 1),
                SubBoard(
                    boardWidth: subBoardWidth,
                    boardHeight: subBoardHeight,
                    boardNum: 2),
              ],
            ),
            Row(
              children: [
                SubBoard(
                    boardWidth: subBoardWidth,
                    boardHeight: subBoardHeight,
                    boardNum: 3),
                SubBoard(
                    boardWidth: subBoardWidth,
                    boardHeight: subBoardHeight,
                    boardNum: 4),
                SubBoard(
                    boardWidth: subBoardWidth,
                    boardHeight: subBoardHeight,
                    boardNum: 5),
              ],
            ),
            Row(
              children: [
                SubBoard(
                    boardWidth: subBoardWidth,
                    boardHeight: subBoardHeight,
                    boardNum: 6),
                SubBoard(
                    boardWidth: subBoardWidth,
                    boardHeight: subBoardHeight,
                    boardNum: 7),
                SubBoard(
                    boardWidth: subBoardWidth,
                    boardHeight: subBoardHeight,
                    boardNum: 8),
              ],
            )
          ],
        ));
  });
}
