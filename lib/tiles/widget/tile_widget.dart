import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'package:ultimate_tic_tac_toe/pages/app_settings.dart';
import '../main_board.dart';

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
  bool aiPlaying = false;
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

  _updateTile(BuildContext context, TileWidget widget) {
    setState(() {
      MainBoard mb = widget._tile.getSubBoard().getBoard();
      if (mb.isSinglePlayer() && !mb.getIsMenu()) {
        if (mb.getStartingTurn() == mb.getTurn()) {
          widget._tile.placeTile();
          if (mb.getStartingTurn() == mb.getTurn()) {
            return;
          } else {
            Future.delayed(Duration(seconds: 1), () {
              mb.getAIMove().placeTile();
              widget._notifySubBoard(context, widget._tile.getSubBoard());
            });
          }
        }
      } else if (mb.getIsMenu()) {
      } else {
        widget._tile.placeTile();
      }
      widget._notifySubBoard(context, widget._tile.getSubBoard());
    });
  }

  Widget symbolForTile(TileWidget tileWidget) {
    String xIcon = AppSettingState.currentXIcon;
    String oIcon = AppSettingState.currentOIcon;
    Tile tile = tileWidget._tile;
    Widget widget;
    switch (tile.getTile()) {
      case TileState.none:
        widget = Container(key: const Key("Empty Tile"));
        break;

      case TileState.O:
        widget = Image.asset(oIcon, key: const Key("O Tile"));
        break;

      case TileState.X:
        widget = Image.asset(xIcon, key: const Key("X Tile"));
        break;
    }
    return widget;
  }
}
