import 'package:flutter_mobile/domain/model/authencation/pin_data_model.dart';

abstract class AuthencationReponsitory {
  Future<PinDataModel> checkPinType({required int businessCd});
}
