import 'package:ultimate_tic_tac_toe/tiles/solved.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

import 'main_board.dart';

class SubBoard extends Solved {
  final Board _board;
  late List<List<Tile>> _tiles;
  TileState _winner = TileState.none;
  SubBoard(Board board) : _board = board {
    _tiles = List<List<Tile>>.generate(
        _board.size(),
        (int i) =>
            List<Tile>.generate(_board.size(), (int j) => Tile(this, i, j)));
  }

  Board getBoard() {
    return _board;
  }

  Tile getTile(int i, int j) {
    return _tiles[i][j];
  }

  void setWinner(TileState winner) {
    _winner = winner;
  }

  TileState getWinner() {
    return _winner;
  }

  List<List<TileState>> getTileWinners() {
    int size = _board.size();
    List<List<TileState>> winners = List<List<TileState>>.generate(
        size,
        (int index) =>
            List<TileState>.generate(size, (int index) => TileState.none));
    for (int i = 0; i < _tiles.length; i++) {
      for (int j = 0; j < _tiles[0].length; j++) {
        winners[i][j] = getTile(i, j).getTile();
      }
    }
    return winners;
  }
}
