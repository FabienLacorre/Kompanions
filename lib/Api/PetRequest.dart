import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:kompanions/Classes/Pet.dart';

class PetRequest {
  Future<List<Pet>> fetchPets() async {
    final response = await http.get(Uri.parse('http://localhost:3000/pet'));
    print(response.body);
    if (response.statusCode == 200) {
      print("i-<<<<<<<<<<<<-------------->>>>>>>>>>>>ci");
      // print(json.decode(response.body));
      json.decode(response.body).forEach((p) => print(p));
      print("i------------ci");
      // return json
      //     .decode(response.body)
      //     .map<Pet>((p) => {new Pet(name: p.name, race: p.race, img: p.img)});
      return json
          .decode(response.body)
          .map<Pet>((x) => Pet.fromJson(x))
          .toList();
    } else {
      throw Exception('Failed to load pets from API');
    }
  }
}
