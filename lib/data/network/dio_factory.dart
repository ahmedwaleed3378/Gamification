import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String token = _appPreferences.getUserToken();
    String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.bearer + token,
      DEFAULT_LANGUAGE: language // todo get lang from app prefs
    };
    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: Constants.apiTimeOut,
        sendTimeout: Constants.apiTimeOut);

    /// to show all info about API request and response
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}
