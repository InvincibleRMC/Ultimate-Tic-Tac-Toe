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

    // if (sb == null) {
    // TODO THROWS WHEN LENGTH IS 0???
    // List<int> enemySbCoords =
    //     _board.getAvailableSubBoards()[
    //         Random(_seed).nextInt(_board.getAvailableSubBoards().length)]);

    sb ??= _board.getAvailableSubBoards()[
        Random(_seed).nextInt(_board.getAvailableSubBoards().length)];
    //}
    Tile enemyMove = sb.getAvailableTiles()[
        Random(_seed).nextInt(sb.getAvailableTiles().length)];
    return enemyMove;
  }

  // Scoring function from
  // http://forum.dominionstrategy.com/index.php?topic=12355.0
  int _getTileScore(List<int> tileLoc) {
    int score = 0;

    //TODO add check for win move
    // MainBoard testBoard = MainBoard.copy(_board);

    // List<int> subLoc = _board.getPointFromSubBoard(t.getSubBoard());

    // Find tile
    //List<int> tileLoc = t.getSubBoard().getPointFromTile(t);
    // Favor Center
    if (tileLoc[0] == 1 && tileLoc[1] == 1) {
      score = score + 5;
    }
    // Corner
    else if (tileLoc[0] + tileLoc[1] == 2) {
      score = score + 3;
    } else {
      score = score + 1;
    }

    return score;
  }

  int _minimax(int depth, List<int> tileLoc, MainBoard currBoard, bool isMax,
      int maxDepth) {
    if (depth == maxDepth) {
      return _getTileScore(tileLoc);
    }
    SubBoard? sb = currBoard.getCurrentSubboard();

    //Picks Subboard to keep state space small
    if (sb == null) {
      List<SubBoard> possibleSubBoards = currBoard.getAvailableSubBoards();
      List<int> scores = List<int>.filled(possibleSubBoards.length, -1);
      for (int i = 0; i < possibleSubBoards.length; i++) {
        List<int> subBoardLoc =
            currBoard.getPointFromSubBoard(possibleSubBoards[i]);

        if (subBoardLoc[0] == 1 && subBoardLoc[1] == 1) {
          scores[i] = 5;
        }
        // Corner
        else if (subBoardLoc[0] + subBoardLoc[1] == 2) {
          scores[i] = 3;
        } else {
          scores[i] = 1;
        }
      }
      int max =
          scores.reduce((value, element) => value > element ? value : element);

      List<int> indexes = [];

      for (int i = 0; i < scores.length; i++) {
        if (max == scores[i]) {
          indexes.add(i);
        }
      }
      sb = possibleSubBoards[indexes[Random(_seed).nextInt(indexes.length)]];
    }

    List<Tile> possibleMoves;
    possibleMoves = sb.getAvailableTiles();

    if (possibleMoves.isEmpty) {
      return 0;
    }

    if (isMax) {
      List<int> scores = [];
      for (int i = 0; i < possibleMoves.length; i++) {
        MainBoard copy = MainBoard.copy(currBoard);
        List<int> subloc =
            currBoard.getPointFromSubBoard(possibleMoves[i].getSubBoard());
        List<int> tileloc =
            possibleMoves[i].getSubBoard().getPointFromTile(possibleMoves[i]);

        copy
            .getSubBoard(subloc[0], subloc[1])
            .getTile(tileloc[0], tileloc[1])
            .placeTile();

        scores.add(_minimax(depth + 1, sb.getPointFromTile(possibleMoves[i]),
            copy, false, maxDepth));
      }

      return scores
          .reduce((value, element) => value > element ? value : element);
    } else {
      List<int> scores = [];
      for (int i = 0; i < possibleMoves.length; i++) {
        MainBoard copy = MainBoard.copy(currBoard);
        List<int> subloc =
            currBoard.getPointFromSubBoard(possibleMoves[i].getSubBoard());
        List<int> tileloc =
            possibleMoves[i].getSubBoard().getPointFromTile(possibleMoves[i]);

        copy
            .getSubBoard(subloc[0], subloc[1])
            .getTile(tileloc[0], tileloc[1])
            .placeTile();
        scores.add(_minimax(depth + 1, sb.getPointFromTile(possibleMoves[i]),
            copy, true, maxDepth));
      }
      return scores.reduce((curr, next) => curr < next ? curr : next);
    }
  }

  Tile _medium() {
    return _board.getSubBoard(0, 0).getTile(0, 0);
  }

  Tile _hard() {
    return _board.getSubBoard(0, 0).getTile(0, 0);
  }
}
