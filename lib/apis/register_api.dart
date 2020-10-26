import 'dart:convert';
import 'package:http/http.dart' as http;

final String ipAddress = 'http://192.168.0.26:8080/';
final String url = '${ipAddress}api/';

Future<dynamic> postData(data, apiUrl) async {
  var fullUrl = url + apiUrl;
  return await http.post(fullUrl,
      body: jsonEncode(data), headers: _setHeaders());
}

Future<dynamic> getData(apiUrl) async {
  var fullUrl = url + apiUrl;
  return await http.get(fullUrl, headers: _setHeaders());
}

_setHeaders() => {
//  'Authorization': 'Bearer $accessToken',
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
