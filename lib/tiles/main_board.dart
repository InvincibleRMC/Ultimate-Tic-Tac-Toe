import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class Board {
  final int _size;
  late List<SubBoard> _subBoards;

  TileState _turn = TileState.X;
  Board(int size) : _size = size {
    _subBoards = List.filled((size * size), SubBoard(this));
  }

  int size() {
    return _size;
  }

  SubBoard getSubBoard(int i, int j) {
    return _subBoards.elementAt(i * _size + j);
  }

  TileState getTurn() {
    return _turn;
  }

  void nextTurn() {
    _turn = (_turn == TileState.X) ? TileState.O : TileState.X;
  }
}
