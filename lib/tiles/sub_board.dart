import 'package:ultimate_tic_tac_toe/tiles/tile.dart';

import 'main_board.dart';

class SubBoard {
  final Board _board;
  late List<Tile> _tiles;
  SubBoard(Board board) : _board = board {
    _tiles = List<Tile>.generate(
        _board.size() * _board.size(), (int index) => Tile(this));
  }

  Board getBoard() {
    return _board;
  }

  Tile getTile(int i, int j) {
    return _tiles.elementAt(i * _board.size() + j);
  }
}
