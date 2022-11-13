import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ultimate_tic_tac_toe/pages/game.dart';
import 'package:ultimate_tic_tac_toe/pages/game_conclusion.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';
import 'package:ultimate_tic_tac_toe/tiles/tile_state.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Game Conclusion navigation tests', () {
    late NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('GameConclusion to Home', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const GameConclusion(winner: TileState.X),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.byKey(const Key("home_button")));
      await tester.pumpAndSettle();

      // ...and there should be a DetailsPage present in the widget tree...
      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(GamePage), findsNothing);
    });

    testWidgets('GameConclusion to Game', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const GameConclusion(winner: TileState.X),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.byKey(const Key("game_button")));
      await tester.pumpAndSettle();

      // ...and there should be a DetailsPage present in the widget tree...
      expect(find.byType(GamePage), findsOneWidget);
      expect(find.byType(HomePage), findsNothing);
    });
  });
}
