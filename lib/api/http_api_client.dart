import 'package:dio/dio.dart';

import 'dio_http_api_client.dart';

/// An abstract class to interfere b/w dio client and app request
abstract class HttpApiClient {
  static const int defaultTimeout = 150000;

  /// To get dio http client instance
  static HttpApiClient getInstance({int timeOut = defaultTimeout}) {
    return DioHttpApiClient(timeOut: timeOut);
  }

  /// Function to handle error
  handleError(DioError e, {List? acceptedErrorResponse});

  /// Function to request for get api
  get(String url,
      {Map<String, dynamic>? header,
      List? acceptedErrorResponse,
      Map<String, dynamic>? queryParameters});

  /// Function to request for post api
  post(String url, var payload,
      {Map<String, dynamic>? header, List? acceptedErrorResponse});

  /// Function to request for put api
  put(String url, var payload,
      {required Map<String, dynamic> header, List? acceptedErrorResponse});

  delete(String url, var payload,
      {required Map<String, dynamic> header, List? acceptedErrorResponse});
}
