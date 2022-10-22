import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class Tile {
  final SubBoard _subBoard;
  TileState state = TileState.none;
  Tile(SubBoard subBoard) : _subBoard = subBoard;

  SubBoard getSubBoard() {
    return _subBoard;
  }

  //setTile and toggle the Board Turn
  void setTile() {
    if (tileSet()) {
      return;
    }
    state = _subBoard.getBoard().getTurn();
    _subBoard.getBoard().nextTurn();
  }

  TileState getTile() {
    return state;
  }

  bool tileSet() {
    return state != TileState.none;
  }
}
