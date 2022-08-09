import 'package:flutter_mobile/data/repository/statement_reponsitory_impl.dart';
import 'package:flutter_mobile/domain/model/statement/satement_request.dart';
import 'package:flutter_mobile/domain/model/statement/statement_model.dart';
import 'package:flutter_mobile/domain/repository/statement_reponsitory.dart';
import 'package:flutter_mobile/import.dart';

class StatementUseCase {
  final StatementReponsitory _statementReponsitory = StatementReponsitoryImpl();

  Future<void> getStatementReport(
      {required DateTime fromDate,
      required DateTime toDate,
      required String? subAccoNo,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      final StatementModel statement =
          await _statementReponsitory.getR9008DataSource(SatementRequest(
              accountType: '0',
              subAccoNo: subAccoNo,
              fromDate: fromDate.formatTimeServer(),
              toDate: toDate.formatTimeServer()));
      onSuccess(statement);
    } catch (errr) {
      onFailure(errr);
    }
  }
}
