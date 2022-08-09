import 'dart:async';

import 'package:flutter_mobile/import.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  const Clock({this.pattern = 'HH:mm:ss', required this.builder, Key? key})
      : super(key: key);

  final String pattern;
  final Widget Function(BuildContext context, String content) builder;

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _currentTime = DateTime.now();
  int seconds = 1;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _updateTime() async {
    await 1.seconds.delay();
    setState(() {
      _currentTime = DateTime.now();
    });
    _updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
        context, DateFormat(widget.pattern).format(_currentTime));
  }
}
