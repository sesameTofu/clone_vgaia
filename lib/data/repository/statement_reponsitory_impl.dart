import 'dart:convert';

import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/domain/model/statement/satement_request.dart';
import 'package:flutter_mobile/domain/model/statement/statement_model.dart';
import 'package:flutter_mobile/domain/repository/statement_reponsitory.dart';

class StatementReponsitoryImpl extends StatementReponsitory {
  final RestClientBase _client = RestClientBase();

  @override
  Future<StatementModel> getR9008DataSource(
      SatementRequest r9008request) async {
    final ApiResponse response = await _client.post('getR9008DataSource',
        data: <String, dynamic>{'filter': jsonEncode(r9008request.toMap())});

    if (response.statusCode == 0 && response.data != null) {
      return StatementModel.fromMap(response.data as Map<String, dynamic>);
    }
    throw throw ApiError.fromResponse(response);
  }
}
