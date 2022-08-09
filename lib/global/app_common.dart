import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/global/app_enum.dart';

class AppCommon {
  static List<Filter> listTimer = <Filter>[
    Filter(id: 1, label: 'Hôm nay'),
    Filter(id: 2, label: '1 tuần'),
    Filter(id: 3, label: '1 tháng'),
    Filter(id: 4, label: '3 tháng'),
    Filter(id: 5, label: '6 tháng'),
    Filter(id: 6, label: '1 năm'),
  ];

  Map<String, StatusWebSocket> mapStatus = <String, StatusWebSocket>{
    '0': StatusWebSocket.CONNECTED,
    '2': StatusWebSocket.PING_PONG,
    '4': StatusWebSocket.EVENT,
    '9': StatusWebSocket.DISCONNECTED,
  };
}
