import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

void main() {
  test('Turn Change', () {
    Board board = Board(3);
    expect(board.getTurn(), TileState.X);
    board.nextTurn();
    expect(board.getTurn(), TileState.O);
    board.nextTurn();
    expect(board.getTurn(), TileState.X);
  });

  test('Unique Subboard', () {
    Board board = Board(3);
    SubBoard sub1 = board.getSubBoard(0, 0);
    SubBoard sub2 = board.getSubBoard(0, 0);
    expect(sub1, sub2);

    SubBoard sub3 = board.getSubBoard(0, 1);
    expect(sub1 == sub3, false);
  });
}
