import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/domain/model/screener/screener.dart';
import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:grpc/grpc.dart';

abstract class ScreenerReponsitory {
  Future<List<Screeeners>?> getScreeners();

  Future<void> createScreener(ScreenerModel screenerModel);

  Future<void> deleteScreener(String idScreener);

  Future<ResponseStream<ScreenerResponse>> findIndicatorScreener(
      {required ScreenerModel filter, int? offset});
}
