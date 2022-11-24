import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

abstract class Solved {
  bool solved(List<List<TileState>> tiles) {
    print(tiles);
    return winner(tiles) != TileState.none;
  }

  TileState winner(List<List<TileState>> tiles) {
    if (_solveHorizontal(tiles) != TileState.none) {
      return _solveHorizontal(tiles);
    }
    if (_solveVertical(tiles) != TileState.none) {
      return _solveVertical(tiles);
    }
    if (_solvedLeftDiagonal(tiles) != TileState.none) {
      return _solvedLeftDiagonal(tiles);
    }
    if (_solvedRightDiagonal(tiles) != TileState.none) {
      return _solvedRightDiagonal(tiles);
    }

    return TileState.none;
  }

  TileState _solvedLeftDiagonal(List<List<TileState>> tiles) {
    //Check Left Diagonal
    TileState diagonal = tiles[0][0];
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i][i] == TileState.none) {
        return TileState.none;
      }
      if (diagonal != tiles[i][i]) {
        return TileState.none;
      }
    }
    return diagonal;
  }

  TileState _solvedRightDiagonal(List<List<TileState>> tiles) {
    TileState diagonal = tiles[0][2];
    //Check Right Diagonal
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i][tiles.length - 1 - i] == TileState.none) {
        return TileState.none;
      }
      if (diagonal != tiles[i][tiles.length - 1 - i]) {
        return TileState.none;
      }
    }
    return diagonal;
  }

  TileState _solveHorizontal(List<List<TileState>> tiles) {
    for (int i = 0; i < tiles[0].length; i++) {
      if (tiles[i][0] == tiles[i][1] &&
          tiles[i][1] == tiles[i][2] &&
          tiles[i][0] != TileState.none) {
        return tiles[i][0];
      }
    }
    return TileState.none;
  }

  TileState _solveVertical(List<List<TileState>> tiles) {
    for (int i = 0; i < tiles[0].length; i++) {
      if (tiles[0][i] == tiles[1][i] &&
          tiles[1][i] == tiles[2][i] &&
          tiles[0][i] != TileState.none) {
        return tiles[0][i];
      }
    }
    return TileState.none;
  }
}
