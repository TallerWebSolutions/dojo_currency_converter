import 'package:dojocurrencyconverter/currency_field_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Currency field controller', () {
    test('should convert to zero if no value is passed', () {
      final controller = CurrencyFieldController();
      final textConverted = controller.convert(5);
      expect(textConverted, "0");
    });
  });
}
