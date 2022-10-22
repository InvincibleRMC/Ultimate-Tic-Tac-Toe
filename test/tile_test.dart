import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

void main() {
  test('Tile Setting', () {
    Board board = Board(3);
    Tile tile = board.getSubBoard(0, 0).getTile(0, 0);
    tile.setTile(TileState.O);
    expect(tile.getTile(), TileState.O);
    tile.setTile(TileState.X);
    expect(tile.getTile(), TileState.X);
    tile.setTile(TileState.none);
    expect(tile.getTile(), TileState.none);
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

    t.setTile(TileState.O);
    expect(t.tileSet(), true);

    t.setTile(TileState.X);
    expect(t.tileSet(), true);
  });
}
