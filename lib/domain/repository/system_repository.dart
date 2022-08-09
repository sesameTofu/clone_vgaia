import 'package:flutter_mobile/domain/model/front_initial_model_mobile.dart';

abstract class SystemRepository {
  Future<FrontInitialModelMobile?> initTradingAnonymous();

  Future<FrontInitialModelMobile?> initTradingMobile();
  //check pinType
}
