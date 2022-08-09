import 'package:flutter/services.dart';
import 'package:flutter_mobile/extensions/string.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class ReplaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String oldText = oldValue.text;
    String newText =
        newValue.text.replaceSemicolon(fromDecimal: ',', toDecimal: '.');
    // New nguoi dung nhap cham .
    if (newText.endsWith('.')) {
      // Neu old da co . thi set lai bang old
      final int last = newText.lastIndexOf('.');
      final int first = oldText.indexOf('.');
      if (oldText.contains('.') && last != first) {
        newText = oldText;
      }
    }

    return TextEditingValue(
      text: newText,
      selection: newValue.selection.copyWith(
        baseOffset: newText.length,
        extentOffset: newText.length,
      ),
    );
  }
}
