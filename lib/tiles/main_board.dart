import 'package:flutter/cupertino.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'board.dart';

class MainBoard extends Board {
  late List<List<SubBoard>> _subBoards;
  SubBoard? _currentSB;
  final bool _isSinglePlayer;

  bool _tied = false;

  @visibleForTesting
  void setTied() {
    _tied = true;
  }

  @visibleForTesting
  bool isTiedTesting() {
    return _tied;
  }

  TileState _turn = TileState.X;

  MainBoard([bool isSinglePlayer = false, int size = 3])
      : _isSinglePlayer = isSinglePlayer,
        super(size) {
    _subBoards = List<List<SubBoard>>.generate(
        size,
        (int index) =>
            List<SubBoard>.generate(size, (int index) => SubBoard(this)));
  }

  SubBoard getSubBoard(int i, int j) {
    return _subBoards[i][j];
  }

  TileState getTurn() {
    return _turn;
  }

  void nextTurn() {
    _turn = (_turn == TileState.X) ? TileState.O : TileState.X;
  }

  List<int> getPointFromSubBoard(SubBoard sb) {
    int locI = -1, locJ = -1;
    for (int i = 0; i < _subBoards.length; i++) {
      for (int j = 0; j < _subBoards.length; j++) {
        if (_subBoards[i][j] == sb) {
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

  List<dynamic> getAvailableSubBoards() {
    var emptySpaces = [];

    for (int i = 0; i < _subBoards.length; i++) {
      for (int j = 0; j < _subBoards[0].length; j++) {
        if (_subBoards[i][j].solved(_subBoards[i][j].getTileStates()) ==
            false) {
          emptySpaces.add(_subBoards[i][j]);
        }
      }
    }

    //var flat = emptySpaces.expand((i) => i).toList();
    return emptySpaces;
  }

  List<List<TileState>> getSubBoardStates() {
    List<List<TileState>> states = List<List<TileState>>.generate(
        size(),
        (int index) =>
            List<TileState>.generate(size(), (int index) => TileState.none));
    for (int i = 0; i < _subBoards.length; i++) {
      for (int j = 0; j < _subBoards[0].length; j++) {
        states[i][j] = getSubBoard(i, j).getWinner();
      }
    }

    return states;
  }

  SubBoard? getCurrentSubboard() {
    return _currentSB;
  }

  bool isSinglePlayer() {
    return _isSinglePlayer;
  }

  void setCurrentSubboard(SubBoard? sb) {
    _currentSB = sb;
  }

  bool isTied(List<List<TileState>> tiles) {
    return !solved(tiles) && allDataSet(tiles);
  }

  bool allDataSet(List<List<TileState>> data) {
    for (int i = 0; i < size(); i++) {
      for (int j = 0; j < size(); j++) {
        if (data[i][j] == TileState.none ||
            !_subBoards[i][j].allDataSet(data)) {
          return false;
        }
      }
    }
    return true;
  }
}
