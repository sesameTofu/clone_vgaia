import 'package:flutter_mobile/extensions/extension.dart';

class AuthenticationParams {
  String? username;
  String? password;
  String? refreshToken;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username ?? '',
        'password': password ?? '',
        'refreshToken': refreshToken ?? '',
      };
}

class Authentication {
  Authentication({
    this.accessToken,
    this.expiresIn,
    this.refreshExpiresIn,
    this.refreshToken,
    this.tokenType,
    this.notBeforePolicy,
    this.sessionState,
    this.scope,
  });

  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        accessToken: json['access_token'] as String?,
        expiresIn: json['expires_in'] as int?,
        refreshExpiresIn: json['refresh_expires_in'] is num
            ? json['refresh_expires_in'] as num?
            : ((json['refresh_expires_in'] as String?) ?? '').formatNumber(),
        refreshToken: json['refresh_token'] as String?,
        tokenType: json['token_type'] as String?,
        notBeforePolicy: json['not-before-policy'] as num?,
        sessionState: json['session_state'] as String?,
        scope: json['scope'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'access_token': accessToken,
        'expires_in': expiresIn,
        'refresh_expires_in': refreshExpiresIn,
        'refresh_token': refreshToken,
        'token_type': tokenType,
        'not-before-policy': notBeforePolicy,
        'session_state': sessionState,
        'scope': scope,
      };

  String? accessToken;
  int? expiresIn;
  num? refreshExpiresIn;
  String? refreshToken;
  String? tokenType;
  num? notBeforePolicy;
  String? sessionState;
  String? scope;

  @override
  String toString() {
    return 'Authentication(accessToken: $accessToken, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn, refreshToken: $refreshToken, tokenType: $tokenType, notBeforePolicy: $notBeforePolicy, sessionState: $sessionState, scope: $scope)';
  }
}
