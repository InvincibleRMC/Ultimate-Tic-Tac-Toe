import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/game_conclusion.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/sub_board_widget.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class MainBoardWidget extends StatefulWidget {
  final MainBoard _board;
  final double _boardWidthPixels;
  final double _boardHeightPixels;

  //TODO make a square not rectangle?
  const MainBoardWidget({
    Key? key,
    required MainBoard board,
    required double boardWidthPixels,
    required double boardHeightPixels,
  })  : _board = board,
        _boardWidthPixels = boardWidthPixels,
        _boardHeightPixels = boardHeightPixels,
        super(key: key);

  @override
  State<StatefulWidget> createState() => MainBoardWidgetState();
}

class MainBoardWidgetState extends State<MainBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return gameBoard();
  }

  void _boardRefresh(BuildContext context, MainBoard b) {
    setState(() {
      if (b.solved(b.getSubBoardWinners()) || b.emptyChild()) {
        TileState winner = b.winner(b.getSubBoardWinners());

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameConclusion(winner: winner),
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
              notifyBoard: _boardRefresh,
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
