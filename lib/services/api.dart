import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:whitefleet/constants/cont.dart';

class ApiService {
  static Map<String, String>? _header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${authCont.bearerToken}'
  };
  // ignore: body_might_complete_normally_nullable
  static Future<Response?> post(
      String endPoint, Map<String, dynamic>? body) async {
    final response = await http.post(Uri.parse(endPoint),
        headers: _header, body: jsonEncode(body));
    print(response.statusCode);
    print(response);
    print(body);
    print(Uri.parse(endPoint));
    if (response.body.isNotEmpty) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
    }
    if (response.statusCode == 200) {
      return response;
    }
  }

  // ignore: body_might_complete_normally_nullable
  static Future<Response?> put(
      String endPoint, Map<String, dynamic>? body) async {
    final response = await http.put(Uri.parse(endPoint),
        headers: _header, body: jsonEncode(body));
    print(response.statusCode);
    if (response.body.isNotEmpty) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
    }
    if (response.statusCode == 200) {
      return response;
    }
  }

  // ignore: body_might_complete_normally_nullable
  static Future<Response?> get(String endPoint) async {
    final response = await http.get(Uri.parse(endPoint), headers: _header);
    final jsonData = jsonDecode(response.body);
    print(jsonData);
    if (response.statusCode == 200) {
      return response;
    }
  }

  // ignore: body_might_complete_normally_nullable
  static Future<Response?> delete(
      String endPoint, Map<String, dynamic>? body) async {
    final response = await http.delete(Uri.parse(endPoint),
        headers: _header, body: jsonEncode(body));
    print(response.statusCode);
    if (response.body.isNotEmpty) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
    }
    if (response.statusCode == 200) {
      return response;
    }
  }
}
