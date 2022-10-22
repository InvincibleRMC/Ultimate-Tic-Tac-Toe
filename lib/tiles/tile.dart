import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class Tile {
  final SubBoard _subBoard;
  TileState state = TileState.none;
  Tile(SubBoard subBoard) : _subBoard = subBoard;

  SubBoard getSubBoard() {
    return _subBoard;
  }

  void setTile(TileState state) {
    this.state = state;
  }

  TileState getTile() {
    return state;
  }

  bool tileSet() {
    return state != TileState.none;
  }
}
