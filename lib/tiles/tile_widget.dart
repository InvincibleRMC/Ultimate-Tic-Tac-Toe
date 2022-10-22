import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class TileWidget extends StatelessWidget {
  final double tileDim;
  final int x;
  final int y;
  final Tile tile;

  const TileWidget({
    required this.tileDim,
    required this.x,
    required this.y,
    required this.tile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tileDim,
      height: tileDim,
      child: TextButton(onPressed: () => updateTile(), child: symbolForTile()),
    );
  }

  printCords() {
    print(x);
    print(y);
  }

  void updateTile() {
    //TODO
    //check if board is solved

    //TODO
    //check if this is a "current board"

    tile.setTile(tile.getSubBoard().getBoard().getTurn());
    tile.getSubBoard().getBoard().nextTurn();

    //TODO
    //set board solved if solved
    //If solved draw an X or O over the board
  }

  Widget symbolForTile() {
    Widget widget;

    switch (tile.getState()) {
      case TileState.none:
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
