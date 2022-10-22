import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

void main() {
  test('Constructor test', () {
    Board board = Board(3);
    SubBoard sub = board.getSubBoard(0, 0);
    int size = board.size();
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        expect(sub.getTile(i, j).getTile(), TileState.none);
      }
    }
  });
  test('Unique Tile', () {
    Board board = Board(3);
    SubBoard sub1 = board.getSubBoard(0, 0);
    Tile tile1 = sub1.getTile(0, 0);
    Tile tile2 = sub1.getTile(0, 0);
    expect(tile1, tile2);
    Tile tile3 = sub1.getTile(0, 1);
    expect(tile1 == tile3, false);
  });
}
