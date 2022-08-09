import 'package:flutter_mobile/core_support/enum/core_enum.dart';

class MarketSession {
  MarketSession({
    required this.index,
    this.session,
  });

  Index index;
  MarketStatusSession? session;
}
