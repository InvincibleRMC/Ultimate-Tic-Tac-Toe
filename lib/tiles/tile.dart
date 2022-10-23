import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

import 'main_board.dart';

class Tile {
  final SubBoard _subBoard;
  TileState state = TileState.none;
  Tile(SubBoard subBoard) : _subBoard = subBoard;

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
    state = b.getTurn();
    b.nextTurn();
  }

  TileState getTile() {
    return state;
  }

  bool tileSet() {
    return state != TileState.none;
  }
}
