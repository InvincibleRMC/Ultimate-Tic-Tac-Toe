import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

void main() {
  test('Solved test', () {
    Board b = Board();
    b.solved(b.getSubBoardWinners());
    expect(b.solved(b.getSubBoardWinners()), false);
  });
  test('Solved Diagonal test', () {
    Board b = Board();
    //Checking Left Diagonal

    expect(b.solved(b.getSubBoardWinners()), false);
    b.getSubBoard(0, 0).setWinner(TileState.X);
    b.getSubBoard(1, 1).setWinner(TileState.X);
    b.getSubBoard(2, 2).setWinner(TileState.X);
    expect(b.solved(b.getSubBoardWinners()), true);
    b.getSubBoard(2, 2).setWinner(TileState.O);
    expect(b.solved(b.getSubBoardWinners()), false);

    //Checking Right Diagonal
    expect(b.solved(b.getSubBoardWinners()), false);
    b.getSubBoard(0, 2).setWinner(TileState.O);
    b.getSubBoard(1, 1).setWinner(TileState.O);
    b.getSubBoard(2, 0).setWinner(TileState.O);
    expect(b.solved(b.getSubBoardWinners()), true);
    b.getSubBoard(2, 0).setWinner(TileState.X);
    expect(b.solved(b.getSubBoardWinners()), false);
  });
  test('Solved Horizontal test', () {
    Board b = Board();

    expect(b.solved(b.getSubBoardWinners()), false);
    b.getSubBoard(0, 0).setWinner(TileState.X);
    b.getSubBoard(0, 1).setWinner(TileState.X);
    b.getSubBoard(0, 2).setWinner(TileState.X);
    expect(b.solved(b.getSubBoardWinners()), true);
    b.getSubBoard(0, 2).setWinner(TileState.O);
    expect(b.solved(b.getSubBoardWinners()), false);
  });
  test('Solved Vertical test', () {
    Board b = Board();

    expect(b.solved(b.getSubBoardWinners()), false);
    b.getSubBoard(0, 0).setWinner(TileState.X);
    b.getSubBoard(1, 0).setWinner(TileState.X);
    b.getSubBoard(2, 0).setWinner(TileState.X);
    expect(b.solved(b.getSubBoardWinners()), true);
    b.getSubBoard(2, 0).setWinner(TileState.O);
    expect(b.solved(b.getSubBoardWinners()), false);
  });
}
