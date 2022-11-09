import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board_widget.dart';

import '../pages/game_conclusion.dart';

class BoardWidget extends StatefulWidget {
  final MainBoard _board;
  final double _boardWidthPixels;
  final double _boardHeightPixels;

  //TODO make a square not rectangle?
  const BoardWidget({
    Key? key,
    required MainBoard board,
    required double boardWidthPixels,
    required double boardHeightPixels,
  })  : _board = board,
        _boardWidthPixels = boardWidthPixels,
        _boardHeightPixels = boardHeightPixels,
        super(key: key);

  double getBoardWidthPixels() {
    return _boardWidthPixels;
  }

  double getBoardHeightPixels() {
    return _boardHeightPixels;
  }

  @override
  State<StatefulWidget> createState() => BoardWidgetState();
}

class BoardWidgetState extends State<BoardWidget> {
  @override
  Widget build(BuildContext context) {
    return gameBoard();
  }

  void boardRefresh(BuildContext context, MainBoard b) {
    setState(() {
      if (b.solved(b.getSubBoardWinners()) || b.emptyChild()) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GameConclusion(),
            ));
      }
    });
  }

  Widget gameBoard() {
    return Builder(builder: (context) {
      const int boardCount = 3;

      final subBoardHeight = widget._boardHeightPixels / boardCount;
      final subBoardWidth = widget._boardWidthPixels / boardCount;

      final children = <Widget>[];

      for (int i = 0; i < boardCount; i++) {
        final childrenRow = <Widget>[];
        for (int j = 0; j < boardCount; j++) {
          childrenRow.add(
            SubBoardWidget(
              subBoard: widget._board.getSubBoard(i, j),
              boardWidthPixels: subBoardWidth,
              boardHeightPixels: subBoardHeight,
              notifyBoard: boardRefresh,
            ),
          );
        }
        children.add(Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: childrenRow));
        // children.add(const SizedBox(width: 0, height: 0));
      }

      return Column(
          mainAxisAlignment: MainAxisAlignment.center, children: children);
    });
  }
}
