import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kompanions/Classes/Pet.dart';

class PetRequest {
  Future<List<Pet>> fetchPets() async {
    final response = await http.get(Uri.parse('http://localhost:3000/pet'));
    print(response.body);
    if (response.statusCode == 200) {
      print("PET REQUEST: pets");
      print(response.body);
      return json
          .decode(response.body)
          .map<Pet>((x) => Pet.fromJson(x))
          .toList();
    } else {
      throw Exception('Echec du chargements des kompanions');
    }
  }
}
