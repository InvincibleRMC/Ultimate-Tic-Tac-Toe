import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class TileWidget extends StatefulWidget {
  final double _tileDim;
  final Tile _tile;
  final Function _notifySubBoard;

  @override
  State<TileWidget> createState() => TileWidgetState();

  const TileWidget({
    Key? key,
    required double tileDim,
    required Tile tile,
    required Function notifySubBoard,
  })  : _tileDim = tileDim,
        _tile = tile,
        _notifySubBoard = notifySubBoard,
        super(key: key);
}

class TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget._tileDim,
      child: TextButton(
        onPressed: () => {updateTile(context, widget)},
        child: symbolForTile(widget),
      ),
    );
  }

  void updateTile(BuildContext context, TileWidget widget) {
    setState(() {
      widget._tile.setTile();
      widget._notifySubBoard(context, widget._tile.getSubBoard());
    });
  }

  Widget symbolForTile(TileWidget tileWidget) {
    Tile tile = tileWidget._tile;
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
