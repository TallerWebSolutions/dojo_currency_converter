import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dojocurrencyconverter/main.dart';

void main() {
  group("Currency converter", () {
    testWidgets("should show a field for input current currency",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      var inputLabelWidget = find.text('Moeda de entrada');
      var inputTextWidget = find.byType(TextField);

      expect(inputLabelWidget, findsOneWidget);
      expect(inputTextWidget, findsOneWidget);
    });

    testWidgets("should show a output with converted value",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      var userTyped = "2";
      var convertedValue = "10";
      var inputTextWidget = find.byType(TextField);
      await tester.enterText(inputTextWidget, userTyped);
      var button = find.byKey(const Key("ConvertButton"));
      await tester.tap(button);
      await tester.pump();
      var findTextWidget = find.text('O valor convertido é: $convertedValue');

      expect(findTextWidget, findsOneWidget);
    });

    testWidgets("should convert to zero if no value is passed",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final button = find.byKey(const Key("ConvertButton"));
      await tester.tap(button);
      final textConverted = find.text('O valor convertido é: 0');
      expect(textConverted, findsOneWidget);
    });
  });
}
