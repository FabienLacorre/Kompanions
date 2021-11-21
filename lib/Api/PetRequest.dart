import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:kompanions/Classes/Pet.dart';

class PetRequest {
  Future<List<Pet>> fetchPets() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/pets/dummy'));
    print(response.body);
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map<Pet>((x) => Pet.fromJson(x))
          .toList();
    } else {
      throw Exception('Failed to load pets from API');
    }
  }
}
