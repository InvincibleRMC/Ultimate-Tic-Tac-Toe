import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';

void main() {
  test('AI generation', () {
    MainBoard easy = MainBoard(difficulty: "Easy");
    MainBoard medium = MainBoard(difficulty: "Medium");
    MainBoard hard = MainBoard(difficulty: "Hard");
  });
  test('Medium Logic Test', () {
    MainBoard medium = MainBoard(difficulty: "Medium");
    expect(medium.getAI().getTile(), medium.getSubBoard(0, 0).getTile(0, 0));
  });
  test('Hard Logic Test', () {
    MainBoard hard = MainBoard(difficulty: "Hard");
    expect(hard.getAI().getTile(), hard.getSubBoard(0, 0).getTile(0, 0));
  });
}
