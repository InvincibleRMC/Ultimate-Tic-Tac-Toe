import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/tileState.dart';

class BoardTile extends StatelessWidget {
  final double tileDim;
  final int x;
  final int y;
  final int boardNum;
  final TileState tileState;
  final VoidCallback onPress;

  const BoardTile(
      {required this.tileState,
      required this.tileDim,
      required this.x,
      required this.y,
      required this.boardNum,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tileDim,
      height: tileDim,
      child: TextButton(onPressed: onPress, child: symbolForTile()),
    );
  }

  printCords() {
    print(x);
    print(y);
    print(boardNum);
  }

  Widget symbolForTile() {
    Widget widget;

    switch (tileState) {
      case TileState.NONE:
        widget = Container();
        break;

      case TileState.O:
        widget = Image.asset('images/o.png');
        break;

      case TileState.X:
        widget = Image.asset('images/x.png');
        break;
    }

    return widget;
  }
}
