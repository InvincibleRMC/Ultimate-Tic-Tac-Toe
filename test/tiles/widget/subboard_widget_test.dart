import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/sub_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/sub_board_widget.dart';

void main() {
  testWidgets("SubBoard Widget Test", (tester) async {
    MainBoard b = MainBoard();
    SubBoard sb = b.getSubBoard(0, 0);

    const Key keySBW = Key("sbw");

    String stringKeySBW = keySBW.toString();

    Key keyEmpty = Key("$stringKeySBW Empty Tile");
    Key keyO = Key("$stringKeySBW O Tile");
    Key keyX = Key("$stringKeySBW X Tile");

    SubBoardWidget sbw = SubBoardWidget(
        key: keySBW,
        subBoard: sb,
        boardSizePixels: 40,
        notifyBoard: (BuildContext context, MainBoard b) => {});

    Widget mediaWidget = MediaQuery(
        data: const MediaQueryData(size: Size(100, 100)), child: sbw);

    await tester.pumpWidget(
        Directionality(textDirection: TextDirection.ltr, child: mediaWidget));
    expect(find.byKey(keyEmpty), findsOneWidget);
    expect(find.byKey(keyO), findsNothing);
    expect(find.byKey(keyX), findsNothing);

    // Confirm the widegt update
    sb.setWinner(TileState.X);
    await tester.tap(find.byWidget(sbw));
    await tester.pump();

    expect(find.byKey(keyEmpty), findsNothing);
    expect(find.byKey(keyO), findsNothing);
    expect(find.byKey(keyX), findsOneWidget);
  });
}
