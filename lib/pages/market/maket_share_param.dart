import 'package:flutter_mobile/import.dart';

class MarketShareParam with ChangeNotifier {
  factory MarketShareParam() {
    return _singleton;
  }

  MarketShareParam._internal();

  static final MarketShareParam _singleton = MarketShareParam._internal();
  String _selectedIndex = '100';
  final String _userDefault = 'ADMIN';

  String get selectedIndex => _selectedIndex;
  String get userDefault => _userDefault;
  set selectedIndex(String value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
