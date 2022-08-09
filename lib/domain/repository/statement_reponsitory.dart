import 'package:flutter_mobile/domain/model/statement/satement_request.dart';
import 'package:flutter_mobile/domain/model/statement/statement_model.dart';

abstract class StatementReponsitory {
  Future<StatementModel> getR9008DataSource(SatementRequest r9008request);
}
