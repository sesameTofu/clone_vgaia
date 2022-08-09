import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/global_data_manager.dart';
import 'package:flutter_mobile/core/data/stock_repository_impl.dart';
import 'package:flutter_mobile/data/repository/system_repository_impl.dart';
import 'package:flutter_mobile/domain/model/front_initial_model_mobile.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/domain/repository/system_repository.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';

class SystemUseCase {
  static final SystemUseCase share = SystemUseCase();
  final SystemRepository _repository = SystemRepositoryIpml();

  final MarketUseCase _marketUseCase = MarketUseCase();

  Future<void> initStockInfo() async {
    try {
      final List<MrktSecInfoItem> listSecInfo =
          await _marketUseCase.getAllMrktSecInfo();

      StockRepositoryImpl().setStocksWithOpenApp(listSecInfo);
      final MarketInitDataItem? marketInitDataItem =
          await _marketUseCase.getMarketInitData();
      StockRepositoryImpl().setMarketInitDataItem(marketInitDataItem);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  Future<FrontInitialModelMobile?> initTradingMobile() async {
    try {
      final FrontInitialModelMobile? _initialModelMobile =
          await _repository.initTradingMobile();

      if (_initialModelMobile != null) {
        GlobalDataManager().setFrontInitialModelMobile = _initialModelMobile;

        return _initialModelMobile;
      }

      throw Exception('.....');
    } catch (exception) {
      return null;
    }
  }
}
