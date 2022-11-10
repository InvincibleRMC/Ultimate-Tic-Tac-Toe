import 'package:ultimate_tic_tac_toe/tiles/solved.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class Board extends Solved {
  final int _size;
  int _childCount;
  //List<List<T>> _data;
  TileState _winner = TileState.none;
  //List<List<TileState>> winners;

  Board([int size = 3])
      : _size = size,
        _childCount = size * size;

  int size() {
    return _size;
  }

  bool emptyChild() {
    return _childCount == 0;
  }

  void setChildEmpty() {
    _childCount = 0;
  }

  void placedAChild() {
    _childCount--;
  }

  void setWinner(TileState t) {
    _winner = t;
  }

  TileState getWinner() {
    return _winner;
  }
}
