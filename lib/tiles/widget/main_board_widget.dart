import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/game_conclusion.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/sub_board_widget.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import '../sub_board.dart';

class MainBoardWidget extends StatefulWidget {
  final MainBoard _board;
  final double _boardWidthPixels;
  final double _boardHeightPixels;
  Timer? _timer;
  //TODO make a square not rectangle?
  MainBoardWidget({
    Key? key,
    required MainBoard board,
    required double boardWidthPixels,
    required double boardHeightPixels,
    Timer? timer,
  })  : _board = board,
        _boardWidthPixels = boardWidthPixels,
        _boardHeightPixels = boardHeightPixels,
        _timer = timer,
        super(key: key);

  @override
  State<StatefulWidget> createState() => MainBoardWidgetState();
}

class MainBoardWidgetState extends State<MainBoardWidget> {
  late bool isFirstMove;
  Timer? timer;
  @override
  void initState() {
    super.initState();

    if (widget._board.getIsMenu()) {
      isFirstMove = true;

      timer = Timer.periodic(const Duration(milliseconds: 2000), (Timer t) {
        menuMove(isFirstMove);
      });
      isFirstMove = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: gameBoard());
  }

  void _boardRefresh(BuildContext context, MainBoard b) {
    if (b.getIsMenu()) {
      return;
    }

    setState(() {
      if (b.solved(b.getSubBoardStates()) || b.isTied(b.getSubBoardStates())) {
        TileState winner = b.winner(b.getSubBoardStates());

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GameConclusion(winner: winner),
            ));
      }
    });
  }

  void menuMove(bool isFirstMove) {
    setState(() {
      SubBoard? sb;

      if (isFirstMove) {
        sb = widget._board.getAvailableSubBoards()[
            Random().nextInt(widget._board.getAvailableSubBoards().length)];
      } else {
        sb = widget._board.getCurrentSubboard();
      }

      widget._board.getAIMove().placeTile();
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
