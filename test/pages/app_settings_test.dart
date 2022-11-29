import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ultimate_tic_tac_toe/pages/home.dart';
import 'package:ultimate_tic_tac_toe/pages/app_settings.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  test('_changeIcon()', () {
    AppSettingState appSettingState = AppSettingState();

    appSettingState.changeIcon("Classic");
    expect(AppSettingState.getCurrentXIcon(), "images/x.png");
    expect(AppSettingState.getCurrentOIcon(), "images/o.png");

    appSettingState.changeIcon("Pets");
    expect(AppSettingState.getCurrentXIcon(), "images/dog.png");
    expect(AppSettingState.getCurrentOIcon(), "images/cat.png");

    appSettingState.changeIcon("Sports");
    expect(AppSettingState.getCurrentXIcon(), "images/football.png");
    expect(AppSettingState.getCurrentOIcon(), "images/soccer.png");

    appSettingState.changeIcon("Suits");
    expect(AppSettingState.getCurrentXIcon(), "images/hearts.png");
    expect(AppSettingState.getCurrentOIcon(), "images/spades.png");

    appSettingState.changeIcon("Time");
    expect(AppSettingState.getCurrentXIcon(), "images/sun.png");
    expect(AppSettingState.getCurrentOIcon(), "images/moon.png");
  });

  testWidgets('drop_down_button test', (WidgetTester tester) async {
    AppSettings as = const AppSettings();
    await tester.pumpWidget(MaterialApp(
      home: as,
    ));

    await tester.tap(find.byKey(const Key("drop_down_button")));
    await tester.pumpAndSettle();
  });
  group('AppSettings navigation tests', () {
    late NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('AppSettings to Home', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const AppSettings(),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.byKey(const Key("home_button")));
      await tester.pumpAndSettle();

      // ...and there should be a DetailsPage present in the widget tree...
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
