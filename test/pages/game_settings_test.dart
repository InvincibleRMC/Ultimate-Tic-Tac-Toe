import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ultimate_tic_tac_toe/pages/game.dart';
import 'package:ultimate_tic_tac_toe/pages/game_settings.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('turn_button', (WidgetTester tester) async {
    GameSettings gs = const GameSettings();
    await tester.pumpWidget(MaterialApp(
      home: gs,
    ));

    await tester.tap(find.byKey(const Key("turn_button")));
    await tester.pumpAndSettle();
  });
  testWidgets('move_highlighting_button', (WidgetTester tester) async {
    GameSettings gs = const GameSettings();
    await tester.pumpWidget(MaterialApp(
      home: gs,
    ));

    await tester.tap(find.byKey(const Key("move_highlighting_button")));
    await tester.pumpAndSettle();
  });
  testWidgets('drop_down_button', (WidgetTester tester) async {
    GameSettings gs = const GameSettings();
    await tester.pumpWidget(MaterialApp(
      home: gs,
    ));

    await tester.tap(find.byKey(const Key("drop_down_button")));
    await tester.pumpAndSettle();
  });

  group('GameSettings navigation tests', () {
    late NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('GameSettings to Home', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const GameSettings(),

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

    testWidgets('GameSettings to 1 Player', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const GameSettings(),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.byKey(const Key("single_player_button")));
      await tester.pumpAndSettle();

      // ...and there should be a DetailsPage present in the widget tree...
      expect(find.byType(GamePage), findsOneWidget);
      expect(find.byKey(const Key("single_player")), findsOneWidget);
      expect(find.byType(HomePage), findsNothing);
    });

    testWidgets('GameSettings to 2 Player', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const GameSettings(),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.byKey(const Key("two_player_button")));
      await tester.pumpAndSettle();

      // ...and there should be a DetailsPage present in the widget tree...
      expect(find.byType(GamePage), findsOneWidget);
      expect(find.byKey(const Key("two_player")), findsOneWidget);
      expect(find.byType(HomePage), findsNothing);
    });
  });
}
