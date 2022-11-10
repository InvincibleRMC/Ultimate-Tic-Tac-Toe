import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'board.dart';

class MainBoard extends Board {
  late List<List<SubBoard>> _subBoards;
  SubBoard? _currentSB;

  TileState _turn = TileState.X;

  MainBoard([int size = 3]) : super(size) {
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
