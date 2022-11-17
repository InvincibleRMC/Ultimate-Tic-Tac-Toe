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

    // If board or subboard is solved don't place
    if (b.solved(b.getSubBoardStates())) {
      return;
    }
    if (_subBoard.solved(_subBoard.getTileStates())) {
      return;
    }
    // If the tile is set do not place
    if (tileSet()) {
      return;
    }
    // If the subboard is not the current subboard do not place unless it is null
    if (_subBoard == b.getCurrentSubboard() || b.getCurrentSubboard() == null) {
    } else {
      return;
    }

    // Set the winner and update the turn
    _state = b.getTurn();
    b.nextTurn();

    // Find the next subboard from current tile
    List<int> loc = _subBoard.getPointFromTile(this);
    SubBoard s = b.getSubBoard(loc[0], loc[1]);

    //If s is Tied remove current subboard
    if (s.isTied(_subBoard.getTileStates())) {
      b.setCurrentSubboard(null);
    } else {
      b.setCurrentSubboard(s);
    }

    if (_subBoard.solved(_subBoard.getTileStates())) {
      _subBoard.setWinner(_subBoard.winner(_subBoard.getTileStates()));
    }
  }

  TileState getTile() {
    return _state;
  }

  bool tileSet() {
    return _state != TileState.none;
  }
}
