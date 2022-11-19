import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

import '../main_board.dart';
import '../sub_board.dart';

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
        onPressed: () => {_updateTile(context, widget)},
        child: symbolForTile(widget),
      ),
    );
  }

  bool activeAi = true;
  _updateTile(BuildContext context, TileWidget widget) {
    setState(() {
      MainBoard? mb = widget._tile.getSubBoard().getBoard();
      if (mb.isSinglePlayer()) {
        enemyMove(mb);
      } else {
        widget._tile.placeTile();
      }
      widget._notifySubBoard(context, widget._tile.getSubBoard());
    });
  }

  void enemyMove(MainBoard mb) {
    if (mb.getTurn() == TileState.X) {
      widget._tile.placeTile();

      Future.delayed(Duration(seconds: 1), () {
        SubBoard? sb =
            widget._tile.getSubBoard().getBoard().getCurrentSubboard();

        if (sb == null) {
          List<int> enemySbCoords = mb.getPointFromSubBoard(
              mb.getAvailableSubBoards()[
                  Random().nextInt(mb.getAvailableSubBoards().length)]);

          SubBoard enemySb = mb.getSubBoard(enemySbCoords[0], enemySbCoords[1]);

          List<int> enemyMove = enemySb.getAvailableTiles()[
              Random().nextInt(enemySb.getAvailableTiles().length)];

          enemySb.getTile(enemyMove[0], enemyMove[1]).placeTile();
        } else {
          List<int> enemyMove = sb.getAvailableTiles()[
              Random().nextInt(sb.getAvailableTiles().length)];
          sb.getTile(enemyMove[0], enemyMove[1]).placeTile();
        }

        widget._notifySubBoard(context, widget._tile.getSubBoard());
      });
    }
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
