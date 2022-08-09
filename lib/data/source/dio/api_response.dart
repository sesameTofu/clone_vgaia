class ApiResponse {
  ApiResponse.fromJson(Map<String, dynamic> json)
      : statusCode = json['statusCode'] as int?,
        errorCode = json['errorCode'] as String?,
        errorField = json['errorField'] as String?,
        message = json['message'] as String?,
        data = json['data'];

  int? statusCode;
  String? errorCode;
  String? errorField;
  String? message;
  dynamic data;
}

class ResponseRequest {
  ResponseRequest({
    required this.status,
    required this.error,
  });
  factory ResponseRequest.fromJson(Map<String, dynamic> json) =>
      ResponseRequest(
        status: json['status'] as String?,
        error: json['error'] == null
            ? null
            : Error.fromJson(json['error'] as Map<String, dynamic>),
      );

  String? status;
  Error? error;
}

class Error {
  Error({
    this.code,
    this.message,
  });
  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json['code'] as String?,
        message: json['message'] as String?,
      );

  String? code;
  String? message;
}
