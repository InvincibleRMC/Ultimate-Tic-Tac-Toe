import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'board.dart';

class MainBoard extends Board {
  late List<List<SubBoard>> _subBoards;
  SubBoard? _currentSB;
  late bool _isSinglePlayer;

  TileState _turn = TileState.X;

  MainBoard(bool isSinglePlayer, [int size = 3]) : super(size) {
    _isSinglePlayer = isSinglePlayer;
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
        if (_subBoards[i][j].solved(_subBoards[i][j].getTileWinners()) ==
            false) {
          emptySpaces.add(_subBoards[i][j]);
        }
      }
    }

    //var flat = emptySpaces.expand((i) => i).toList();
    return emptySpaces;
  }

  List<List<TileState>> getSubBoardWinners() {
    List<List<TileState>> winners = List<List<TileState>>.generate(
        size(),
        (int index) =>
            List<TileState>.generate(size(), (int index) => TileState.none));
    for (int i = 0; i < _subBoards.length; i++) {
      for (int j = 0; j < _subBoards[0].length; j++) {
        winners[i][j] = getSubBoard(i, j).getWinner();
      }
    }

    return winners;
  }

  SubBoard? getCurrentSubboard() {
    return _currentSB;
  }

  bool isSinglePlayer() {
    return _isSinglePlayer;
  }

  void setCurrentSubboard(SubBoard? sb) {
    if (sb == null) {
      _currentSB = null;
      return;
    }
    if (sb.solved(sb.getTileWinners())) {
      _currentSB = null;
    } else {
      _currentSB = sb;
    }
  }
}
