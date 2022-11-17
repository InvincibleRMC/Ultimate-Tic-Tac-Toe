import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

void main() {
  test('Tile Placing', () {
    MainBoard board = MainBoard();
    Tile tile = board.getSubBoard(0, 0).getTile(0, 0);

    //Confirms Starts with Player X
    expect(board.getTurn(), TileState.X);
    tile.placeTile();
    //Assert that the tile is set to X and the turn is updated
    expect(tile.getTile(), TileState.X);
    expect(board.getTurn(), TileState.O);

    //Confirm turn and tile are not changed
    tile.placeTile();
    expect(tile.getTile(), TileState.X);
    expect(board.getTurn(), TileState.O);

    //Clear board
    board = MainBoard();
    tile = board.getSubBoard(1, 1).getTile(0, 0);
    Tile tile2 = board.getSubBoard(1, 1).getTile(0, 2);
    //Confirms Starts with Player X
    expect(board.getTurn(), TileState.X);
    tile.placeTile();
    //Assert that the tile is set to X and the turn is updated
    expect(tile.getTile(), TileState.X);
    expect(board.getTurn(), TileState.O);

    // Should not place because not current subboard.
    tile2.placeTile();
    expect(tile2.getTile(), TileState.none);
  });

  test('Tile Getting', () {
    MainBoard board = MainBoard();
    Tile tile = board.getSubBoard(0, 0).getTile(0, 0);
    expect(tile.getTile(), TileState.none);
  });
  test('TileSet?', () {
    MainBoard board = MainBoard();
    Tile t = board.getSubBoard(0, 0).getTile(0, 0);
    expect(t.tileSet(), false);

    t.placeTile();
    expect(t.tileSet(), true);
  });
}
