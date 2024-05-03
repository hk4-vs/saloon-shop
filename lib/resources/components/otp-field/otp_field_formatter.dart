import 'package:flutter/services.dart';

class SingleDigitInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 1) {
      return oldValue;
    }
    return newValue;
  }
}
