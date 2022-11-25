import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/game_conclusion.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/sub_board_widget.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/tile_widget.dart';

import '../sub_board.dart';

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
  late bool isFirstMove;
  late Timer _everySecond;

  @override
  void initState() {
    super.initState();
    isFirstMove = true;

    _everySecond = Timer.periodic(Duration(milliseconds: 2000), (Timer t) {
      _menuMove(isFirstMove);
    });
    isFirstMove = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: gameBoard());
  }

  void _boardRefresh(BuildContext context, MainBoard b) {
    setState(() {
      if (b.solved(b.getSubBoardStates()) || b.isTied(b.getSubBoardStates())) {
        TileState winner = b.winner(b.getSubBoardStates());

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameConclusion(winner: winner),
            ));
      }
    });
  }

  void _menuMove(bool isFirstMove) {
    setState(() {
      SubBoard? sb;

      if (isFirstMove) {
        sb = widget._board.getAvailableSubBoards()[
            Random().nextInt(widget._board.getAvailableSubBoards().length)];
      } else {
        sb = widget._board.getCurrentSubboard();
      }

      if (sb == null) {
        List<int> enemySbCoords = widget._board.getPointFromSubBoard(
            widget._board.getAvailableSubBoards()[Random()
                .nextInt(widget._board.getAvailableSubBoards().length)]);

        SubBoard enemySb =
            widget._board.getSubBoard(enemySbCoords[0], enemySbCoords[1]);

        List<int> enemyMove = enemySb.getAvailableTiles()[
            Random().nextInt(enemySb.getAvailableTiles().length)];

        enemySb.getTile(enemyMove[0], enemyMove[1]).placeTile();
      } else {
        List<int> enemyMove = sb.getAvailableTiles()[
            Random().nextInt(sb.getAvailableTiles().length)];
        sb.getTile(enemyMove[0], enemyMove[1]).placeTile();
      }
    });
  }

  Widget gameBoard() {
    return Builder(builder: (context) {
      final int boardCount = widget._board.size();
      final double subBoardHeight = widget._boardHeightPixels / boardCount;
      final double subBoardWidth = widget._boardWidthPixels / boardCount;

      final List<Widget> children = <Widget>[];

      for (int i = 0; i < boardCount; i++) {
        for (int j = 0; j < boardCount; j++) {
          children.add(
            SubBoardWidget(
              subBoard: widget._board.getSubBoard(i, j),
              boardWidthPixels: subBoardWidth,
              boardHeightPixels: subBoardHeight,
              notifyBoard: _boardRefresh,
            ),
          );
        }
      }

      return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        shrinkWrap: true,
        children: children,
      );
    });
  }
}
