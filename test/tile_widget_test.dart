import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/tiles/board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_widget.dart';

void main() {
  testWidgets("Tile Widget Test", (tester) async {
    Board b = Board();
    Tile tile = b.getSubBoard(0, 0).getTile(0, 0);
    const keyEmpty = Key("Empty Tile");
    const keyO = Key("O Tile");
    const keyX = Key("X Tile");
    TileWidget tw =
        TileWidget(tileDim: 40, tile: tile, notifySubBoard: () => {});

    await tester.pumpWidget(
        Directionality(textDirection: TextDirection.ltr, child: tw));
    expect(find.byKey(keyEmpty), findsOneWidget);
    expect(find.byKey(keyO), findsNothing);
    expect(find.byKey(keyX), findsNothing);

    // Tapping the widget to confirm that it becomes an X
    await tester.tap(find.byWidget(tw));
    await tester.pump();
    expect(find.byKey(keyEmpty), findsNothing);
    expect(find.byKey(keyO), findsNothing);
    expect(find.byKey(keyX), findsOneWidget);

    // Tapping the widget to confirm that it does not change after set
    await tester.tap(find.byWidget(tw));
    await tester.pump();
    expect(find.byKey(keyEmpty), findsNothing);
    expect(find.byKey(keyO), findsNothing);
    expect(find.byKey(keyX), findsOneWidget);
  });
}
