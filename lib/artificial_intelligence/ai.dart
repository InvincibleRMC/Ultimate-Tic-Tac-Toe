import 'dart:math';

import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import '../tiles/sub_board.dart';
import '../tiles/tile.dart';

class AI {
  final MainBoard _board;
  int? _seed;
  final TileState _turn;
  late Tile Function() fun;

  AI(MainBoard board, String difficulty, TileState turn, [int? seed])
      : _board = board,
        _turn = turn {
    if (seed == null) {
      _seed = Random().nextInt(4294967296);
    } else {
      _seed = seed;
    }

    if (difficulty == "Easy") {
      fun = _easy;
    } else if (difficulty == "Medium") {
      fun = _medium;
    } else if (difficulty == "Hard") {
      fun = _hard;
    }
  }

  void setSeed(int seed) {
    _seed = seed;
  }

  Tile getTile() {
    //TODO make a setting maybe
    //sleep(const Duration(milliseconds: 1000));
    return fun();
  }

  Tile _easy() {
    SubBoard? sb = _board.getCurrentSubboard();

    if (sb == null) {
      // TODO THROWS WHEN LENGTH IS 0???
      List<int> enemySbCoords = _board.getPointFromSubBoard(
          _board.getAvailableSubBoards()[
              Random(_seed).nextInt(_board.getAvailableSubBoards().length)]);

      sb = _board.getSubBoard(enemySbCoords[0], enemySbCoords[1]);
    }
    List<int> enemyMove = sb.getAvailableTiles()[
        Random(_seed).nextInt(sb.getAvailableTiles().length)];
    return sb.getTile(enemyMove[0], enemyMove[1]);
  }

  Tile _medium() {
    return _board.getSubBoard(0, 0).getTile(0, 0);
  }

  Tile _hard() {
    return _board.getSubBoard(0, 0).getTile(0, 0);
  }
}
