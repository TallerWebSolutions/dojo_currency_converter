import 'package:flutter/material.dart';

class CurrencyFieldController extends TextEditingController {
  final String defaultValue = "0";

  String convert(double currencyValue) {
    if (text.isNotEmpty) {
      return (int.parse(text) * currencyValue).toString();
    }
    return defaultValue;
  }
}
