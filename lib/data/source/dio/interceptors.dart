import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/global/app_log.dart';

class LoggingInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      debugPrint(
          '===> [DioError][${err.response?.realUri.path}] ${err.response} <===');
    }

    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLog.log.info('===> ${options.method} ${options.baseUrl}${options.path}');
    debugPrint('===> HEADER: ${options.headers}');

    if (options.data != null) {
      AppLog.log.debugPrint('===> [REQUEST DATA]: ${options.data}');
    } else if (options.queryParameters.isNotEmpty) {
      AppLog.log.debugPrint(
          '===> [REQUEST queryParameters]: ${options.queryParameters}');
    }
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    debugPrint(
        '<=== ${response.statusCode} [${response.requestOptions.method}] ${response.requestOptions.baseUrl}${response.requestOptions.path}');

    if (response.requestOptions.data != null) {
      AppLog.log
          .debugPrint('<=== [RESPONSE DATA]: ${response.requestOptions.data}');
    } else if (response.requestOptions.queryParameters.isNotEmpty) {
      AppLog.log.debugPrint(
          '<=== [RESPONSE queryParameters]: ${response.requestOptions.queryParameters}');
    }

    if (response.data is Map || response.data is List) {
      debugPrint(jsonEncode(response.data));
    } else {
      debugPrint('${response.data}');
    }

    return handler.next(response);
  }
}

class SessionInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (SessionManager().accessToken.isNotEmpty) {
      options.headers.addAll(<String, dynamic>{
        'SESSIONID': SessionManager().accessToken,
      });
    }

    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (response.data is String) {
      response.data = jsonDecode(response.data as String);
    }

    if (response.data is Map) {
      switch (response.data['errorCode']) {
      }
    }
    return handler.next(response);
  }
}

class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor(this.dio);

  final Dio dio;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.response?.statusCode ?? 0) {
      case 401:

        /// If lastscreen is Login => don't need set state = [SessionState.expired]
        // if (!Get.find<GlobalDataController>().currentScreenIsLogin &&
        //     err.response?.realUri.path != '/${AppEndPoint.login}') {
        //   AppLog.log.info('[401] with path ${err.response?.realUri.path}');
        //   Get.find<SessionController>().requestExpired();
        //   return;
        // }
        SessionManager().setState = SessionState.loggedOut;

        break;
      default:
        break;
    }
    return handler.next(err);
  }
}

// class CookieManager extends Interceptor {
//   CookieManager(this.cookieJar);
//   final CookieJar cookieJar;

//   @override
//   Future<void> onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final List<Cookie> cookies = await cookieJar.loadForRequest(options.uri);

//     cookies.removeWhere((Cookie cookie) {
//       if (cookie.expires != null) {
//         return cookie.expires?.isBefore(DateTime.now()) ?? true;
//       }

//       return false;
//     });

//     final String cookie = getCookies(cookies);
//     if (cookie.isNotEmpty) {
//       final bool isLogin = options.path.contains('login');
//       options.headers[HttpHeaders.cookieHeader] = isLogin ? null : cookie;
//     }

//     return handler.next(options);
//   }

//   @override
//   void onResponse(
//       Response<dynamic> response, ResponseInterceptorHandler handler) {
//     _saveCookies(response);
//     return handler.next(response);
//   }

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     _saveCookies(err.response);

//     return handler.next(err);
//   }

//   void _saveCookies(Response<dynamic>? response) {
//     if (response != null) {
//       final List<String>? cookies =
//           response.headers[HttpHeaders.setCookieHeader];
//       if (cookies != null) {
//         cookieJar.saveFromResponse(
//           response.realUri,
//           cookies.map((String str) => Cookie.fromSetCookieValue(str)).toList(),
//         );
//       }
//     }
//   }

//   static String getCookies(List<Cookie> cookies) {
//     return cookies
//         .map((Cookie cookie) => '${cookie.name}=${cookie.value}')
//         .join('; ');
//   }
// }
