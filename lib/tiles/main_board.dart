import 'package:ultimate_tic_tac_toe/tiles/solved.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class Board extends Solved {
  final int _size;
  late List<List<SubBoard>> _subBoards;

  TileState _turn = TileState.X;
  Board([int size = 3]) : _size = size {
    _subBoards = List<List<SubBoard>>.generate(
        _size,
        (int index) =>
            List<SubBoard>.generate(_size, (int index) => SubBoard(this)));
  }

  int size() {
    return _size;
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
        _size,
        (int index) =>
            List<TileState>.generate(_size, (int index) => TileState.none));
    for (int i = 0; i < _subBoards.length; i++) {
      for (int j = 0; j < _subBoards[0].length; j++) {
        winners[i][j] = getSubBoard(i, j).getWinner();
      }
    }

    return winners;
  }
}
