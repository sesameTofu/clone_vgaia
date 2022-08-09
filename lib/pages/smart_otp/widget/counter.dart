import 'dart:async';

import 'package:flutter_mobile/global/app_const.dart';
import 'package:flutter_mobile/import.dart';

class Counter extends StatefulWidget {
  const Counter(
      {this.duration = AppConst.timeLiveOTP,
      required this.builder,
      this.step = 1,
      this.onTimeout,
      Key? key})
      : super(key: key);

  final int duration;
  final int step; //seconds
  final void Function()? onTimeout;
  final Widget Function(BuildContext context, int seconds) builder;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int time;

  @override
  void initState() {
    time = widget.duration;
    start();
    super.initState();
  }

  Future<void> start() async {
    await 1.seconds.delay();
    setState(() {
      if (time >= widget.step) {
        time -= 1;
      } else {
        time = widget.duration;
        if (widget.onTimeout != null) {
          widget.onTimeout!();
        }
      }
      start();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, time);
  }
}
