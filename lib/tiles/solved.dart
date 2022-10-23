import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

abstract class Solved {
  bool solved(List<List<TileState>> tiles) {
    return _solveHorizontal(tiles) ||
        _solveVertical(tiles) ||
        _solvedLeftDiagonal(tiles) ||
        _solvedRightDiagonal(tiles);
  }

  bool _solvedLeftDiagonal(List<List<TileState>> tiles) {
    //Check Left Diagonal
    TileState diagonal = tiles[0][0];
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i][i] == TileState.none) {
        return false;
      }
      if (diagonal != tiles[i][i]) {
        return false;
      }
    }
    return true;
  }

  bool _solvedRightDiagonal(List<List<TileState>> tiles) {
    TileState diagonal = tiles[0][2];
    //Check Right Diagonal
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i][tiles.length - 1 - i] == TileState.none) {
        return false;
      }
      if (diagonal != tiles[i][tiles.length - 1 - i]) {
        return false;
      }
    }
    return true;
  }

  bool _solveHorizontal(List<List<TileState>> tiles) {
    for (int i = 0; i < tiles[0].length; i++) {
      if (tiles[i][0] == tiles[i][1] &&
          tiles[i][1] == tiles[i][2] &&
          tiles[i][0] != TileState.none) {
        return true;
      }
    }
    return false;
  }

  bool _solveVertical(List<List<TileState>> tiles) {
    for (int i = 0; i < tiles[0].length; i++) {
      if (tiles[0][i] == tiles[1][i] &&
          tiles[1][i] == tiles[2][i] &&
          tiles[0][i] != TileState.none) {
        return true;
      }
    }
    return false;
  }
}
