import 'dart:io';
import 'dart:math';

import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import '../tiles/sub_board.dart';
import '../tiles/tile.dart';

class AI {
  final MainBoard _board;
  final TileState _turn;
  late Tile Function() fun;

  AI(MainBoard board, String difficulty, TileState turn)
      : _board = board,
        _turn = turn {
    if (difficulty == "Easy") {
      fun = easy;
    } else if (difficulty == "Medium") {
      fun = medium;
    } else if (difficulty == "Hard") {
      fun = hard;
    }
  }

  Tile getTile() {
    //TODO make a setting maybe
    sleep(const Duration(milliseconds: 1000));
    print(fun);
    return fun();
  }

  Tile easy() {
    SubBoard? sb = _board.getCurrentSubboard();
    Tile t;
    if (sb == null) {
      List<int> enemySbCoords = _board.getPointFromSubBoard(
          _board.getAvailableSubBoards()[
              Random().nextInt(_board.getAvailableSubBoards().length)]);

      SubBoard enemySb = _board.getSubBoard(enemySbCoords[0], enemySbCoords[1]);

      List<int> enemyMove = enemySb.getAvailableTiles()[
          Random().nextInt(enemySb.getAvailableTiles().length)];

      t = enemySb.getTile(enemyMove[0], enemyMove[1]);
    } else {
      List<int> enemyMove = sb
          .getAvailableTiles()[Random().nextInt(sb.getAvailableTiles().length)];
      t = sb.getTile(enemyMove[0], enemyMove[1]);
    }

    return t;
  }

  Tile medium() {
    return _board.getSubBoard(0, 0).getTile(0, 0);
  }

  Tile hard() {
    return _board.getSubBoard(0, 0).getTile(0, 0);
  }
}
