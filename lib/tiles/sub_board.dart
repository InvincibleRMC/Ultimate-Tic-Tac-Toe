import 'package:ultimate_tic_tac_toe/tiles/tile.dart';

import 'main_board.dart';

class SubBoard {
  final Board _board;
  late List<List<Tile>> _tiles;
  SubBoard(Board board) : _board = board {
    _tiles = List<List<Tile>>.generate(
        _board.size(),
        (int index) =>
            List<Tile>.generate(_board.size(), (int index) => Tile(this)));
  }

  Board getBoard() {
    return _board;
  }

  Tile getTile(int i, int j) {
    return _tiles[i][j];
  }
}
