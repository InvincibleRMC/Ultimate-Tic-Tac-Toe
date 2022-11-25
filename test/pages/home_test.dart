import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ultimate_tic_tac_toe/pages/game_settings.dart';

import 'package:ultimate_tic_tac_toe/pages/home.dart';
import 'package:ultimate_tic_tac_toe/pages/app_settings.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('MainPage navigation tests', () {
    late NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('Home to AppSettings', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.byKey(const Key("app_settings_button")));
      await tester.pumpAndSettle();

      // ...and there should be a DetailsPage present in the widget tree...
      expect(find.byType(AppSettings), findsOneWidget);
      expect(find.byType(GameSettings), findsNothing);
    });

    testWidgets('Home to GameSettings', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.byKey(const Key("game_settings_button")));
      await tester.pumpAndSettle();

      // ...and there should be a DetailsPage present in the widget tree...
      expect(find.byType(GameSettings), findsOneWidget);
      expect(find.byType(AppSettings), findsNothing);
    });
  });
}
