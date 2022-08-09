import 'package:intl/intl.dart';

extension FormatDate on DateTime {
  String formatTimeServer() {
    final DateFormat formatter = DateFormat('yyyyMMdd');
    return formatter.format(this);
  }

  int formatTimeServerToNumber() {
    final DateFormat formatter = DateFormat('yyyyMMdd');
    return int.parse(formatter.format(this));
  }

  String formatDDMMYYYY({String pattern = '/'}) {
    final DateFormat formatter = DateFormat('dd${pattern}MM${pattern}yyyy');
    return formatter.format(this);
  }

  String formatHHMMSS({String pattern = ':'}) {
    final DateFormat formatter = DateFormat('HH${pattern}mm${pattern}ss');
    return formatter.format(this);
  }

  String formatHHMM({String pattern = ':'}) {
    final DateFormat formatter = DateFormat('HH${pattern}mm');
    return formatter.format(this);
  }

  String get formatSS {
    final DateFormat formatter = DateFormat('ss');
    return formatter.format(this);
  }

  String get formatyyyMMddFromNow {
    final DateFormat formatter = DateFormat('yyyyMMdd');
    return formatter.format(this);
  }

  String get formatDDMMYYYHHMM {
    return DateFormat('dd/MM/yyyy HH:mm').format(this);
  }
  
  String get formatDDMMYYY {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
