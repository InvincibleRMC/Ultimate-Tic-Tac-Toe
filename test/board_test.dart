import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
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
}
