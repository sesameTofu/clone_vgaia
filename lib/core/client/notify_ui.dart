import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_mobile/core/interface/notify_interface.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';

class NotifyUI {
  NotifyUI(this._notifiInterface, {this.secCd}) {
    notifyManager.onListen = hasConnection;
    notifyManager.onCancel = hasNoConnection;
  }
  final String? secCd;
  final NotifiInterface _notifiInterface;
  final StreamController<Map<Field, dynamic>> notifyManager =
      StreamController<Map<Field, dynamic>>.broadcast();

  Timer? _debounceTime;
  bool _isSubcrible = false;
  bool _isNewData = false;

  void hasConnection() {
    cancelDisconnect();
    _notifiInterface.haveSubcrible();
    _isSubcrible = true;
    debugPrint('xxxxxxhasConnection$secCd');
  }

  void hasNoConnection({int milliseconds = 2000}) {
    cancelDisconnect();
    //define cơ chế recheck sau 10s ko có subcrible thì disconnect
    _debounceTime = Timer(Duration(milliseconds: milliseconds), () async {
      _notifiInterface.noSubcrible();
      _isSubcrible = false;
      _isNewData = false;
      debugPrint('xxxxxxhasNOConnection$secCd');
    });
  }

  void cancelDisconnect() {
    if (_debounceTime?.isActive ?? false) {
      _debounceTime?.cancel();
    }
  }

  void sendata(Map<Field, dynamic> value) {
    if (value[Field.STOCK_WITH_API_DETAIL] == true) {
      _isNewData = true;
    }

    if (value[Field.MARKET_MARKET_INDEX] == true) {
      _isNewData = true;
    }

    notifyManager.add(value);
  }

  bool get isMissDataSocket => !_isSubcrible && !_isNewData;
}
