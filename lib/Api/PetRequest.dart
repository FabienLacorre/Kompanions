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

// FutureBuilder(
//     future: futureAllPet,
//     builder: (BuildContext context, AsyncSnapshot snapshot) {
//       print(snapshot.data);
//       if (snapshot.hasData) {
//         return snapshot.data!.map((pet) => KompanionCard(
//             title: "Capuche",
//             subtitle: "Lapin bélier",
//             photoSrc: "assets/capuche.jpg"));
//       } else {
//         return CustomText(
//           content: 'Aucun kompanions',
//           size: 16,
//           fontWeight: FontWeight.bold,
//         );
//       }
//     }),