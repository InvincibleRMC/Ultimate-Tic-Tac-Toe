import 'package:flutter/cupertino.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import '../artificial_intelligence/ai.dart';
import 'board.dart';

class MainBoard extends Board {
  late List<List<SubBoard>> _subBoards;
  SubBoard? _currentSB;
  final bool _isSinglePlayer;
  late AI _ai;
  final bool _isMenu;

  bool _tied = false;

  @visibleForTesting
  void setTied() {
    _tied = true;
  }

  @visibleForTesting
  bool isTiedTesting() {
    return _tied;
  }

  final TileState _startingTurn;
  TileState _turn;

  MainBoard(
      [bool isSinglePlayer = false,
      String difficulty = "Easy",
      int size = 3,
      bool isMenu = true,
      TileState startingTurn = TileState.X])
      : _isSinglePlayer = isSinglePlayer,
        _isMenu = isMenu,
        _startingTurn = startingTurn,
        _turn = startingTurn,
        super(size) {
    _ai = AI(this, difficulty, TileState.O);
    _subBoards = List<List<SubBoard>>.generate(
        size,
        (int index) =>
            List<SubBoard>.generate(size, (int index) => SubBoard(this)));
  }

  TileState getStartingTurn() {
    return _startingTurn;
  }

  Tile getAIMove() {
    return _ai.getTile();
  }

  bool getIsMenu() {
    return _isMenu;
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

  List<SubBoard> getAvailableSubBoards() {
    List<SubBoard> emptySpaces = [];

    for (int i = 0; i < _subBoards.length; i++) {
      for (int j = 0; j < _subBoards[0].length; j++) {
        if (_subBoards[i][j].solved(_subBoards[i][j].getTileStates()) ==
            false) {
          emptySpaces.add(_subBoards[i][j]);
        }
      }
    }

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
