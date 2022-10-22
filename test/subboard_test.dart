import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
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
}
