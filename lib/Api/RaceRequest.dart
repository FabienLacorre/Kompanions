import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kompanions/Classes/Race.dart';
import 'package:kompanions/FlutterStorage.dart';

class RaceRequest {
  Future<List<Race>> fetch() async {
    final token = await FlutterStorage.readJWTToken();
    if (token == null) {
      throw Exception(
          'Vous devez etre connecté pour charger les races de Kompanions');
    }
    final response = await http.get(
      Uri.parse('http://localhost:3000/race'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token,
      },
    );
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map<Race>((x) => Race.fromJson(x))
          .toList();
    } else {
      throw Exception('Echec du chargements des races de Kompanions');
    }
  }
}
