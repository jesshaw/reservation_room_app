import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reservationroomapp/services/network_service_response.dart';

class RestClient {

  RestClient({httpClient}) : this._http = httpClient ?? http.Client();

  http.Client _http;

  Map<String, String> headers = {
    "Content-Type": 'application/json;charset=UTF-8',
    "Accept": 'application/json, text/plain, */*',
  };

  // crud ref: https://medium.com/swlh/how-to-make-http-requests-in-flutter-d12e98ee1cef
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(
      String resourcePath) async {
    var response = await _http.get(resourcePath);
    return processResponse<T>(response);
  }

  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String resourcePath, dynamic data) async {
    var content = json.encoder.convert(data);
    var response =
        await _http.post(resourcePath, body: content, headers: headers);
    return processResponse<T>(response);
  }

  MappedNetworkServiceResponse<T> processResponse<T>(http.Response response) {
    if (!((response.statusCode < 200) ||
        (response.statusCode >= 300) ||
        (response.body == null))) {
      var jsonResult = response.body;
      dynamic resultClass = jsonDecode(jsonResult);

      return new MappedNetworkServiceResponse<T>(
          mappedResult: resultClass,
          networkServiceResponse: new NetworkServiceResponse<T>(success: true));
    } else {
      var errorResponse = response.body;
      return new MappedNetworkServiceResponse<T>(
          networkServiceResponse: new NetworkServiceResponse<T>(
              success: false,
              message: "(${response.statusCode}) ${errorResponse.toString()}"));
    }
  }
}
