import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:kompanions/Classes/User.dart';

class UserRequest {
  Future connect(email, password) async {
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
    print("USER REQUEST: CONNECT");
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Echec de la connexion');
    }
  }
}
