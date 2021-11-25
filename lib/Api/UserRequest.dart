import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kompanions/FlutterStorage.dart';

class UserRequest {
  Future connect(email, password) async {
    await FlutterStorage.clearStorage();
    final response = await http.post(
      Uri.parse('http://localhost:3000/user/connect'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      await FlutterStorage.writeJWTToken(resp["token"]);
      return resp;
    } else {
      throw Exception(response.body);
    }
  }

  Future register(email, password, confirmPassword) async {
    FlutterStorage.clearStorage();
    final response = await http.post(
      Uri.parse('http://localhost:3000/user/add'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.body);
    }
  }
}
