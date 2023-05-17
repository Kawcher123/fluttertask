import 'dart:convert';
import 'dart:io';
import 'package:flutter_task/app/apis/customExceptions.dart';
import 'package:http/http.dart' as http;

class APIManager {
  Future<dynamic> postApiCall({String? url, var param, Map<String, String>? headerData}) async {
    print("Calling API: $url");
    print("Calling parameters: ${param}");
    print("Calling parameters: ${headerData}");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url!), body: param, headers: headerData ?? {});

      responseJson = apiResponse(response);
    } on SocketException catch (e) {
      print('APIManager.postAPICallWithHeader: $e');

      throw FetchDataException('Socket Exception in postAPICallWithHeader :${e.toString()}');
    } catch (e) {
      throw ('Exception in postAPICallWithHeader :${e.toString()}');
    }
    return responseJson;
  }


  Future<dynamic> getApiCall({String? url, Map<String, String>? headerData}) async {
    print("Calling API: $url");
    print("Calling API header: $headerData");
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url!), headers: headerData ?? {});

      responseJson = apiResponse(response);
    } on SocketException catch (e) {
      throw FetchDataException('Socket Exception in getWithHeader :${e.toString()}');
    } catch (e) {
      throw ('Exception in getWithHeader :${e.toString()}');
    }
    return responseJson;
  }

  dynamic apiResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(response.body.toString());
    }
  }
}
