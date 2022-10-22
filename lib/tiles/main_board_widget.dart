import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board_widget.dart';

class MainBoardWidget extends StatelessWidget {
  final Board _board;
  final double _boardWidthPixels;
  final double _boardHeightPixels;

  //TODO make a square not rectangle?
  const MainBoardWidget({
    Key? key,
    required Board board,
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
  Widget build(BuildContext context) {
    return gameBoard();
  }

  Widget gameBoard() {
    return Builder(builder: (context) {
      const int boardCount = 3;

      final subBoardHeight = _boardHeightPixels / boardCount;
      final subBoardWidth = _boardWidthPixels / boardCount;

      final children = <Widget>[];

      for (int i = 0; i < boardCount; i++) {
        final childrenRow = <Widget>[];
        for (int j = 0; j < boardCount; j++) {
          childrenRow.add(
            SubBoardWidget(
              subBoard: _board.getSubBoard(i, j),
              boardWidthPixels: subBoardWidth,
              boardHeightPixels: subBoardHeight,
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
