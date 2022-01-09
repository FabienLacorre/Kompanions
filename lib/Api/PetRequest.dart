import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:kompanions/Classes/Pet.dart';
import 'package:kompanions/FlutterStorage.dart';

class PetRequest {
  Future<List<Pet>> fetchPets() async {
    final token = await FlutterStorage.readJWTToken();
    if (token == null) {
      throw Exception('Vous devez etre connecté pour charger vos kompanions');
    }
    final response = await http.get(
      Uri.parse('http://localhost:3000/pet'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token,
      },
    );
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map<Pet>((x) => Pet.fromJson(x))
          .toList();
    } else {
      throw Exception('Echec du chargements des kompanions');
    }
  }

  Future<Pet> add(Pet pet) async {
    final token = await FlutterStorage.readJWTToken();
    if (token == null) {
      throw Exception('Vous devez etre connecté pour charger vos kompanions');
    }

    final response = await http.post(
      Uri.parse('http://localhost:3000/pet/add'),
      body: jsonEncode(<String, String>{"name": pet.name}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token,
      },
    );

    if (response.statusCode == 200) {
      return new Pet();
    } else {
      throw Exception('Echec de l\'ajout du kompanion');
    }
  }
}
