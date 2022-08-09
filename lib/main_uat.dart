import 'dart:async';

import 'package:flutter_mobile/base/base_run_main.dart';
import 'package:flutter_mobile/config/uat.config.dart';

Future<void> main() async {
  BaseRunMain.runMainApp(config: UATConfig());
}
