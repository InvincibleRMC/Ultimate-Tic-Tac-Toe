import 'package:ultimate_tic_tac_toe/tiles/board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'main_board.dart';

class SubBoard extends Board {
  final MainBoard _board;
  late List<List<Tile>> _tiles;

  SubBoard(MainBoard board)
      : _board = board,
        super(board.size()) {
    _tiles = List<List<Tile>>.generate(_board.size(),
        (int i) => List<Tile>.generate(_board.size(), (int j) => Tile(this)));
  }

  MainBoard getBoard() {
    return _board;
  }

  Tile getTile(int i, int j) {
    return _tiles[i][j];
  }

  List<dynamic> getAvailableTiles() {
    var emptySpaces = [];

    for (int i = 0; i < _tiles.length; i++) {
      for (int j = 0; j < _tiles[0].length; j++) {
        if (_tiles[i][j].getTile() == TileState.none) {
          emptySpaces.add([i, j]);
        }
      }
    }

    return emptySpaces;
  }

  List<int> getPointFromTile(Tile t) {
    int locI = -1, locJ = -1;
    for (int i = 0; i < _tiles.length; i++) {
      for (int j = 0; j < _tiles[0].length; j++) {
        if (_tiles[i][j] == t) {
          locI = i;
          locJ = j;
        }
      }
    }
    if (locI == -1 || locJ == -1) {
      throw Error();
    }
    return [locI, locJ];
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
