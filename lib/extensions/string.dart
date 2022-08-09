import 'package:intl/intl.dart';

extension StringEx on String {
  bool get isString => RegExp('[a-zA-Z]').hasMatch(this);

  bool get validCharSpec => RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);

  String formatDecimal(String s) {
    return s.replaceAll('', '');
  }

  String formatToDDMMYYYY() {
    final DateTime dateTime = DateTime.parse(this);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  String formatToDDMMYYYYs() {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.tryParse(this) ?? 0);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  String replaceSemicolon({String fromDecimal = ',', String toDecimal = ''}) {
    return replaceAll(fromDecimal, toDecimal);
  }

  DateTime convertStringToDate() {
    return DateFormat('dd/MM/yyyy').parse(this);
  }

  num formatNumber() {
    return num.tryParse(replaceSemicolon()) ?? 0;
  }

  String? getTimeH() {
    final DateTime result = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(this);
    final DateFormat output = DateFormat('HH:mm');
    return output.format(result);
  }

  String? getTimeD() {
    final DateTime result = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(this);
    final DateFormat output = DateFormat('dd/MM');
    return output.format(result);
  }

  String? getTimeDDMMYYYY() {
    final DateTime result = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(this);
    final DateFormat output = DateFormat('dd/MM/yyyy');
    return output.format(result);
  }

  double get parseNumeric => double.parse(this);
}

extension StringExNull on String? {
  bool get isStringNotEmpty => this != null && this!.trim().isNotEmpty;
  bool get isStringEmpty => this != null && this!.trim().isEmpty;
  bool get isString => RegExp('[a-zA-Z]').hasMatch(this!);

  bool get isNumeric {
    if (this == null) {
      return false;
    }
    return double.tryParse(this!) != null;
  }
}
