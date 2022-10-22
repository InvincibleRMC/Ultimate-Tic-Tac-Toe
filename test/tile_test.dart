import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

void main() {
  test('Tile Setting', () {
    Board board = Board(3);
    Tile tile = board.getSubBoard(0, 0).getTile(0, 0);

    //Confirms Starts with Player X
    expect(board.getTurn(), TileState.X);
    tile.setTile();
    //Assert that the tile is set to X and the turn is updated
    expect(tile.getTile(), TileState.X);
    expect(board.getTurn(), TileState.O);

    //Confirm turn and tile are not changed
    tile.setTile();
    expect(tile.getTile(), TileState.X);
    expect(board.getTurn(), TileState.O);
  });

  test('Tile Getting', () {
    Board board = Board(3);
    Tile tile = board.getSubBoard(0, 0).getTile(0, 0);
    expect(tile.getTile(), TileState.none);
  });
  test('TileSet?', () {
    Board board = Board(3);
    Tile t = board.getSubBoard(0, 0).getTile(0, 0);
    expect(t.tileSet(), false);

    t.setTile();
    expect(t.tileSet(), true);
  });
}
