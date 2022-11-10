import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_tic_tac_toe/main.dart';

void main() {
  testWidgets("MyApp Test", (tester) async {
    MyApp app = const MyApp();

    await tester.pumpWidget(
        Directionality(textDirection: TextDirection.ltr, child: app));
    await tester.tap(find.byWidget(app));
    await tester.pump();
  });
}
