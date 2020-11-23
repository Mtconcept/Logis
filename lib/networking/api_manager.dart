import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<http.Response> postData({dynamic body, String endPoint}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return await http.post(endPoint, body: jsonEncode(body), headers: headers);
  }

  Future getData(dynamic body, String endPoint) async {
    return http.get(endPoint);
  }
}
