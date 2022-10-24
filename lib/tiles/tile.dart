import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

import 'main_board.dart';

class Tile {
  final SubBoard _subBoard;
  final int _i;
  final int _j;
  TileState state = TileState.none;
  Tile(SubBoard subBoard, int i, int j)
      : _subBoard = subBoard,
        _i = i,
        _j = j;

  SubBoard getSubBoard() {
    return _subBoard;
  }

  //setTile and toggle the Board Turn
  void setTile() {
    Board b = _subBoard.getBoard();
    if (b.solved(b.getSubBoardWinners())) {
      return;
    }
    if (_subBoard.solved(_subBoard.getTileWinners())) {
      return;
    }
    if (tileSet()) {
      return;
    }
    if (b.getCurrentSubboard() != null) {
      if (_subBoard != b.getCurrentSubboard()) {
        return;
      }
    }
    state = b.getTurn();
    b.nextTurn();
    b.setCurrentSubboard(_i, _j);
  }

  TileState getTile() {
    return state;
  }

  bool tileSet() {
    return state != TileState.none;
  }
}
