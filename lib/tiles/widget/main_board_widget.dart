import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/pages/game_conclusion.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/sub_board_widget.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class MainBoardWidget extends StatefulWidget {
  final MainBoard _board;
  final double _boardSizePixels;
  final bool _highlighting;
  const MainBoardWidget({
    Key? key,
    required MainBoard board,
    required double boardSizePixels,
    bool highlighting = true,
  })  : _board = board,
        _boardSizePixels = boardSizePixels,
        _highlighting = highlighting,
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
      timer = Timer.periodic(const Duration(milliseconds: 2000), (Timer t) {
        _menuMove();
        if (widget._board.getAvailableSubBoards().isEmpty) {
          timer!.cancel();
        }
      });
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

  void _menuMove() {
    setState(() {
      widget._board.getAIMove().placeTile();
    });
  }

  Widget gameBoard() {
    return Builder(builder: (context) {
      final int boardCount = widget._board.size();
      final double subBoardSize = widget._boardSizePixels / boardCount;

      final List<Widget> children = <Widget>[];

      for (int i = 0; i < boardCount; i++) {
        for (int j = 0; j < boardCount; j++) {
          children.add(
            SubBoardWidget(
              subBoard: widget._board.getSubBoard(i, j),
              boardSizePixels: subBoardSize,
              notifyBoard: _boardRefresh,
              highlighting: widget._highlighting,
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
