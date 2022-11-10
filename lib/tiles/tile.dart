import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

import 'main_board.dart';

class Tile {
  final SubBoard _subBoard;
  TileState _state = TileState.none;
  Tile(SubBoard subBoard) : _subBoard = subBoard;

  SubBoard getSubBoard() {
    return _subBoard;
  }

  @visibleForTesting
  void setTile(TileState t) {
    _state = t;
  }

  //placeTile and toggle the Board Turn
  void placeTile() {
    MainBoard b = _subBoard.getBoard();
    if (b.solved(b.getSubBoardWinners())) {
      return;
    }
    if (_subBoard.solved(_subBoard.getTileWinners())) {
      return;
    }
    if (tileSet()) {
      return;
    }

    if (_subBoard != b.getCurrentSubboard() && b.getCurrentSubboard() != null) {
      return;
    }

    List<int> loc = _subBoard.getPointFromTile(this);

    _state = b.getTurn();
    b.nextTurn();
    _subBoard.placedAChild();

    SubBoard s = b.getSubBoard(loc[0], loc[1]);
    if (!s.emptyChild()) {
      b.setCurrentSubboard(s);
    } else {
      b.setCurrentSubboard(null);
    }

    if (_subBoard.solved(_subBoard.getTileWinners())) {
      _subBoard.setChildEmpty();
      _subBoard.setWinner(_subBoard.winner(_subBoard.getTileWinners()));
      b.placedAChild();
    }
  }

  TileState getTile() {
    return _state;
  }

  bool tileSet() {
    return _state != TileState.none;
  }
}
