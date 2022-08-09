import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/portfolio/customer_portfolio_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_information_controller.dart';

class ItemProfitController extends BaseController {
  ItemProfitController(this.index, {required this.listValue}) {
    stockInformationController =
        StockInformationController(secCd: listValue.value[index].secCd ?? '');
    stockInformationController.getStock(listValue.value[index].secCd ?? '');

    stockInformationController.matchPriceStream.listen((num event) {
      if (event != 0) {
        listValue.value[index].currentPrice = event;

        listValue.refresh();
      }
    });
  }
  final int index;

  late final StockInformationController stockInformationController;
  final RxListNotify<CustomerPortfolio> listValue;
}
