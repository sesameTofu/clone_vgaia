import 'package:flutter_mobile/domain/model/local/user_local_model.dart';
import 'package:get_storage/get_storage.dart';

abstract class LocalUserRepository {
  final GetStorage storage = GetStorage();

  Future<void> saveAccount(UserLocalModel userModel);

  List<UserLocalModel> getListAccount();
}
