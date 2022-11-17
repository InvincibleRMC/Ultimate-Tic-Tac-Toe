import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

void main() {
  test('Turn Change', () {
    MainBoard board = MainBoard();
    expect(board.getTurn(), TileState.X);
    board.nextTurn();
    expect(board.getTurn(), TileState.O);
    board.nextTurn();
    expect(board.getTurn(), TileState.X);
  });

  test("Board.getSubBoard()", () {
    MainBoard b = MainBoard();
    // Negative
    expect(() => b.getSubBoard(-1, 0), throwsA(isArgumentError));
    expect(() => b.getSubBoard(0, -1), throwsA(isArgumentError));
    expect(() => b.getSubBoard(1, -1), throwsA(isArgumentError));
    //Upper Bounds
    expect(() => b.getSubBoard(b.size(), b.size()), throwsA(isArgumentError));
    expect(() => b.getSubBoard(b.size(), 0), throwsA(isArgumentError));
    expect(() => b.getSubBoard(0, b.size()), throwsA(isArgumentError));
  });
  test('Unique Subboard', () {
    MainBoard board = MainBoard();
    SubBoard sub1 = board.getSubBoard(0, 0);
    SubBoard sub2 = board.getSubBoard(0, 0);
    expect(sub1, sub2);

    SubBoard sub3 = board.getSubBoard(0, 1);
    expect(sub1 == sub3, false);
  });
  test('Main board Tie Test', () {
    MainBoard board = MainBoard();
    SubBoard s11 = board.getSubBoard(1, 1);
    SubBoard s10 = board.getSubBoard(1, 1);
    SubBoard s12 = board.getSubBoard(1, 1);
    s11.getTile(0, 0).setTile(TileState.X);
    s11.getTile(0, 1).setTile(TileState.X);
    s11.getTile(0, 2).setTile(TileState.O);

    s11.getTile(1, 0).setTile(TileState.O);
    s11.getTile(1, 1).setTile(TileState.X);
    s11.getTile(1, 2).setTile(TileState.X);

    s11.getTile(2, 0).setTile(TileState.X);
    s11.getTile(2, 1).setTile(TileState.O);
    s11.getTile(2, 2).setTile(TileState.O);

    s10.getTile(0, 0).setTile(TileState.X);
    s10.getTile(0, 1).setTile(TileState.X);
    s10.getTile(0, 2).setTile(TileState.O);

    s10.getTile(1, 0).setTile(TileState.O);
    s10.getTile(1, 1).setTile(TileState.X);
    s10.getTile(1, 2).setTile(TileState.X);

    s10.getTile(2, 0).setTile(TileState.X);
    s10.getTile(2, 1).setTile(TileState.O);
    s10.getTile(2, 2).setTile(TileState.O);

    s12.getTile(0, 0).setTile(TileState.X);
    s12.getTile(0, 1).setTile(TileState.X);
    s12.getTile(0, 2).setTile(TileState.O);

    s12.getTile(1, 0).setTile(TileState.O);
    s12.getTile(1, 1).setTile(TileState.X);
    s12.getTile(1, 2).setTile(TileState.X);

    s12.getTile(2, 0).setTile(TileState.X);
    s12.getTile(2, 1).setTile(TileState.O);
    s12.getTile(2, 2).setTile(TileState.O);

    board.getSubBoard(0, 0).setWinner(TileState.X);
    board.getSubBoard(0, 1).setWinner(TileState.O);
    board.getSubBoard(0, 2).setWinner(TileState.X);

    board.getSubBoard(2, 0).setWinner(TileState.O);
    board.getSubBoard(2, 1).setWinner(TileState.X);
    board.getSubBoard(2, 2).setWinner(TileState.O);
  });
}
