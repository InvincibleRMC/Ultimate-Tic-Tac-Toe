import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

void main() {
  test('getAvailableTiles', () {
    MainBoard board = MainBoard();
    SubBoard sub = board.getSubBoard(0, 0);
    sub.getTile(0, 0).setTile(TileState.X);
    sub.getTile(0, 1).setTile(TileState.X);
    sub.getTile(0, 2).setTile(TileState.X);
    sub.getTile(1, 0).setTile(TileState.X);
    sub.getTile(1, 1).setTile(TileState.X);
    expect(sub.getAvailableTiles().length, 4);

    sub.getTile(1, 2).setTile(TileState.X);
    sub.getTile(2, 0).setTile(TileState.X);
    sub.getTile(2, 1).setTile(TileState.X);
    sub.getTile(2, 2).setTile(TileState.X);
    expect(sub.getAvailableTiles().length, 0);
  });
  test('SubBoard Constructor test', () {
    MainBoard board = MainBoard();
    SubBoard sub = board.getSubBoard(0, 0);
    int size = board.size();
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        expect(sub.getTile(i, j).getTile(), TileState.none);
      }
    }
  });

  test("SubBoard.getTile()", () {
    MainBoard b = MainBoard();
    SubBoard s = SubBoard(b);

    Tile tile00 = s.getTile(0, 0);
    Tile tile00Again = s.getTile(0, 0);
    //Assert Tile is the same
    expect(tile00, tile00Again);

    //Assert Tile is unique
    Tile tile01 = s.getTile(0, 1);
    expect(tile00 == tile01, false);

    //Assert Negative Out of Bounds is an error
    expect(() => s.getTile(-1, 0), throwsA(isArgumentError));
    expect(() => s.getTile(0, -1), throwsA(isArgumentError));
    expect(() => s.getTile(1, -1), throwsA(isArgumentError));
    //Assert UpperBound Out of Bounds is an error
    expect(() => s.getTile(b.size(), b.size()), throwsA(isArgumentError));
    expect(() => s.getTile(b.size(), 0), throwsA(isArgumentError));
    expect(() => s.getTile(0, b.size()), throwsA(isArgumentError));
  });
  test("SubBoard.getBoard", () {
    MainBoard b = MainBoard();
    SubBoard s00 = b.getSubBoard(0, 0);
    SubBoard s01 = b.getSubBoard(0, 0);
    expect(s00.getBoard(), b);
    expect(s00.getBoard(), s01.getBoard());
  });

  test("SubBoard tie test", () {
    MainBoard b = MainBoard();
    SubBoard s = b.getSubBoard(0, 0);
    expect(s.isTied(s.getTileStates()), false);
    s.getTile(0, 0).setTile(TileState.X);
    s.getTile(0, 1).setTile(TileState.X);
    s.getTile(0, 2).setTile(TileState.O);

    s.getTile(1, 0).setTile(TileState.O);
    s.getTile(1, 1).setTile(TileState.X);
    s.getTile(1, 2).setTile(TileState.X);

    s.getTile(2, 0).setTile(TileState.X);
    s.getTile(2, 1).setTile(TileState.O);
    s.getTile(2, 2).setTile(TileState.O);
    expect(s.isTied(s.getTileStates()), true);
  });
}
