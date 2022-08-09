import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/data/repository/screener/screener_reponsitory_impl.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/domain/model/screener/screener.dart';
import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/domain/repository/screener/screener_reponsitory.dart';
import 'package:flutter_mobile/domain/usecase/stock_use_case.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:grpc/grpc.dart';

class ScreenerUsecase {
  final ScreenerReponsitory _screenerReponsitory = ScreenerReponsitoryImpl();
  final StockUseCase _stockUseCase = StockUseCase();

  Future<void> getScreeners(
      {required Function(List<ScreenerModel>) onSuccess,
      required Function(dynamic) onFail}) async {
    try {
      final List<Screeeners>? _listScreener =
          await _screenerReponsitory.getScreeners();
      onSuccess(
        _listScreener == null
            ? <ScreenerModel>[]
            : List<ScreenerModel>.from(
                _listScreener
                    .map((Screeeners e) => ScreenerModel.fromScreenerAPI(e)),
              ),
      );
    } catch (e) {
      onFail(e);
    }
  }

  Future<void> createScreener(ScreenerModel screenerModel,
      {required Function() onSuccess,
      required Function(dynamic) onFail}) async {
    try {
      await _screenerReponsitory.createScreener(screenerModel);
      onSuccess();
    } catch (e) {
      onFail(e);
    }
  }

  Future<void> deleteScreener(String idScreener,
      {required Function() onSuccess,
      required Function(dynamic) onFail}) async {
    try {
      await _screenerReponsitory.deleteScreener(idScreener);
      onSuccess();
    } catch (e) {
      onFail(e);
    }
  }

  Future<void> findWorldIndex(int offset, ScreenerModel filter,
      {required Function(List<StockItemViewModel>, int? totalRecords) onSuccess,
      required Function(dynamic) onFail}) async {
    try {
      final ResponseStream<ScreenerResponse> _stream =
          await _screenerReponsitory.findIndicatorScreener(
              offset: offset, filter: filter);

      final List<ScreenerResponse_SecDetailInfo> _marketQuotes =
          <ScreenerResponse_SecDetailInfo>[];
      int? _totalRecords;

      await _stream.forEach((ScreenerResponse element) {
        if (element.status == 0) {
          _totalRecords = element.totalRecords;
          _marketQuotes.addAll(element.secDetailInfo);
        }
      });

      final List<StockItemViewModel> _listItem = <StockItemViewModel>[];
      for (final ScreenerResponse_SecDetailInfo element in _marketQuotes) {
        _stockUseCase.getItemViewModel(element.secCd,
            onSuccess: (StockItemViewModel stockItemView) {
          stockItemView.updateStockInfo(
            StockInfoModel(
                    secID: element.secCd,
                    floorPrice: element.floorPrice,
                    ceilingPrice: element.ceilingPrice,
                    basicPrice: element.basicPrice,
                    matchPrice: element.lastPrice,
                    changePercent: element.changePercent,
                    changePoint: element.changePoint,
                    totalQty: element.totalQty,
                    openPrice: element.lastPrice,
                    closePrice: element.lastPrice,
                    highestPrice: element.highestPrice,
                    lowestPrice: element.lowestPrice,
                    sellForeignQty: element.sellForeignQty,
                    buyForeignQty: element.buyForeignQty,
                    currentRoom: element.currentRoom,
                    best1BidPriceStr: element.best1BidPriceStr,
                    best1BidPrice: element.best1BidPrice,
                    best1BidQty: element.best1BidQty,
                    best2BidPrice: element.best2BidPrice,
                    best2BidQty: element.best2BidQty,
                    best3BidPrice: element.best3BidPrice,
                    best3BidQty: element.best3BidQty,
                    best1OfferPriceStr: element.best1OfferPriceStr,
                    best1OfferPrice: element.best1OfferPrice,
                    best1OfferQty: element.best1OfferQty,
                    best2OfferPrice: element.best2OfferPrice,
                    best2OfferQty: element.best2OfferQty,
                    best3OfferPrice: element.best3OfferPrice,
                    best3OfferQty: element.best3OfferQty,
                    avgPrice: element.avgPrice,
                    dataWithApi: true,
                    bookValue: element.bookValue,
                    // range: element.range,
                    // turnoverRate: element.turnoverRate,
                    esp: element.esp,
                    listedQty: element.listedQty,
                    pb: element.pb,
                    pe: element.pe,
                    ps: element.ps,
                    w52Low: element.w52Low,
                    w52Hight: element.w52High,
                    marketCap: element.marketCap,
                    netSale: element.netSale,
                    roa: element.roa,
                    roe: element.roe,
                    colorCode: element.colorCode.value)
                .toFiled(),
          );
          _listItem.add(stockItemView);
        }, onFailure: (_) {});
      }

      onSuccess(_listItem, _totalRecords);
    } catch (exception) {
      AppLog.log.printError(exception);

      onFail(exception);
    }
  }
}
