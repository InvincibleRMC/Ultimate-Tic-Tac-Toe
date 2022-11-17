import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ultimate_tic_tac_toe/pages/game_conclusion.dart';
import 'package:ultimate_tic_tac_toe/tiles/main_board.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';
import 'package:ultimate_tic_tac_toe/tiles/widget/main_board_widget.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('AppSettings navigation tests', () {
    late NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('Main Board Widget Winner', (WidgetTester tester) async {
      MainBoard b = MainBoard();

      MaterialApp materialWidget = MaterialApp(
        home: MainBoardWidget(
            board: b, boardWidthPixels: 100, boardHeightPixels: 100),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      );

      await tester.pumpWidget(materialWidget);

      expect(find.byType(MainBoardWidget), findsOneWidget);

      b.getSubBoard(0, 0).setWinner(TileState.X);
      b.getSubBoard(0, 1).setWinner(TileState.X);
      b.getSubBoard(0, 2).setWinner(TileState.X);
      await tester.tap(find.byWidget(materialWidget));
      await tester.pumpAndSettle();

      // ...and there should be a DetailsPage present in the widget tree...
      expect(find.byType(GameConclusion), findsOneWidget);
    });

    testWidgets('Main Board Widget Tie', (WidgetTester tester) async {
      MainBoard b = MainBoard();

      MaterialApp materialWidget = MaterialApp(
        home: MainBoardWidget(
            board: b, boardWidthPixels: 100, boardHeightPixels: 100),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      );

      await tester.pumpWidget(materialWidget);

      expect(find.byType(MainBoardWidget), findsOneWidget);

      b.getSubBoard(0, 0).setWinner(TileState.X);
      b.getSubBoard(0, 1).setWinner(TileState.X);
      b.getSubBoard(0, 2).setWinner(TileState.O);

      b.getSubBoard(1, 0).setWinner(TileState.O);
      b.getSubBoard(1, 1).setWinner(TileState.X);
      b.getSubBoard(1, 2).setWinner(TileState.X);

      b.getSubBoard(2, 0).setWinner(TileState.X);
      b.getSubBoard(2, 1).setWinner(TileState.O);
      b.getSubBoard(2, 2).setWinner(TileState.O);
      await tester.tap(find.byWidget(materialWidget));
      await tester.pumpAndSettle();

      // ...and there should be a DetailsPage present in the widget tree...
      expect(find.byType(GameConclusion), findsOneWidget);
    });
  });
}
