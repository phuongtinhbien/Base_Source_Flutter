//import 'package:cooky/cooky/network/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:expense_tracking/data/network/rest_client.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const int TIME_OUT = 30000;

class ApiProvider {
  BaseOptions _options;
  Dio _dio;
  RestClient _client;

  static ApiProvider apiProvider;

  ApiProvider() {
    _dio = Dio();
    _options = new BaseOptions();
  }

  static getInstance() {
    if (apiProvider == null) {
      apiProvider = new ApiProvider();
    }
    return apiProvider;
  }

  RestClient getRestClient() {
    if (_client == null) {
      _client = initRestClient();
    }
    return _client;
  }

  RestClient initRestClient() {
//    String proxy =
//    Platform.isIOS ? '192.168.10.98:8888' : 'localhost:8888';
//    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//        (client) {
//      // Hook into the findProxy callback to set the client's proxy.
//      client.findProxy = (url) {
//        return 'PROXY $proxy';
//      };
//      // This is a workaround to allow Charles to receive
//      // SSL payloads when your app is running on Android.
//      client.badCertificateCallback =
//          (X509Certificate cert, String host, int port) => Platform.isAndroid;
//    };
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
    }

    _options.connectTimeout = TIME_OUT;
    _options.receiveTimeout = TIME_OUT;
    _options.sendTimeout = TIME_OUT;
    _dio.options = _options;

    try {
      //Token
//      String token = TraduoraStorageManager.getToken() ?? "";
//      if (token.isNotEmpty) {
//        _options.headers["Authorization"] = "Bearer ${token}";
//      }
//      String languageCode = LocalStorageService.preferences.getString(SharefKey.LANGUAGE_CODE)??"";
//      if (languageCode.isNotEmpty) {
//        _options.headers["language-code"] = languageCode;
//      }
    } catch (err) {
      if (kDebugMode) {
        print("sharedPreferences: " + err.toString());
      }
    }
//    return RestClient(_dio, baseUrl: FlavorConfig.instance.variables['api_market']);
  }

  void notifyChange() {
    _client = initRestClient();
  }
}
