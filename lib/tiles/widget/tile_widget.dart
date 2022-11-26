import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

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
    //Timer t = Timer.periodic(const Duration(milliseconds: 2000), (Timer t) {});
    setState(() {
      // if (aiPlaying) {
      //   return;
      // }

      MainBoard mb = widget._tile.getSubBoard().getBoard();
      if (mb.isSinglePlayer() && !mb.getIsMenu()) {
        if (mb.getStartingTurn() == mb.getTurn()) {
          widget._tile.placeTile();
          if (mb.getStartingTurn() == mb.getTurn()) {
            return;
          } else {
            sleep(const Duration(milliseconds: 1000));
            // Future.delayed(const Duration(seconds: 1), () {
            mb.getAIMove().placeTile();
            // });
          }
          widget._notifySubBoard(context, widget._tile.getSubBoard());
          // });
        }
        //enemyMove(mb);
      } else if (mb.getIsMenu()) {
      } else {
        widget._tile.placeTile();
      }
      widget._notifySubBoard(context, widget._tile.getSubBoard());
    });
  }

  // void enemyMove(MainBoard mb) {
  //   if (mb.getTurn() == TileState.X) {
  //     widget._tile.placeTile();
  //   }
  //   if (mb.getTurn() == TileState.O) aiPlaying = true;
  //   Future.delayed(const Duration(seconds: 1), () {
  //     aiPlaying = false;
  //   });
  // }

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
