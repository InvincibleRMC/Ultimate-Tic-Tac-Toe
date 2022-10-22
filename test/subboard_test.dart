import 'package:ultimate_tic_tac_toe/pages/game.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board_widget.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

void main() {
  test('Constructor test', () {
    const SubBoard sub =
        SubBoard(boardWidthPixels: 4, boardHeightPixels: 5, boardNum: 0);
    expect(sub.getBoardHeightPixels(), 5);
    expect(sub.getBoardWidthPixels(), 4);
  });
  test('State is empty', () {
    SubBoardState subBoardState = SubBoardState();
    for (final TileState tile in subBoardState.getListTileState()) {
      expect(tile, TileState.none);
    }
  });
}
