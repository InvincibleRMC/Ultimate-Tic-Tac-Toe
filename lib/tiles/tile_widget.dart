import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class TileWidget extends StatefulWidget {
  final double tileDim;
  final Tile tile;

  @override
  State<TileWidget> createState() => TileWidgetState();

  const TileWidget({
    Key? key,
    required this.tileDim,
    required this.tile,
  }) : super(key: key);
}

class TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.tileDim,
      child: TextButton(
          onPressed: () => {updateTile(widget)}, child: symbolForTile(widget)),
    );
  }

  void updateTile(TileWidget widget) {
    Tile tile = widget.tile;
    //TODO
    //check if board is solved

    //TODO
    //check if this is a "current board"

    setState(() {
      tile.setTile();
    });
    //TODO
    //set board solved if solved
    //If solved draw an X or O over the board
  }

  Widget symbolForTile(TileWidget tileWidget) {
    Tile tile = tileWidget.tile;
    Widget widget;

    switch (tile.getTile()) {
      case TileState.none:
        widget = Container(key: const Key("Empty Tile"));
        break;

      case TileState.O:
        widget = Image.asset('images/o.png', key: const Key("O Tile"));
        break;

      case TileState.X:
        widget = Image.asset('images/x.png', key: const Key("X Tile"));
        break;
    }
    return widget;
  }
}
