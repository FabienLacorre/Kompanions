import 'Race.dart';

class Pet {
  String name;
  String img;
  Race? race;

  Pet({this.name = "", this.race, this.img = "assets/capuche.jpg"});

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        name: json["name"] != null ? json["name"] : "",
        race: json["race"] != null
            ? new Race.fromJson(json["race"])
            : new Race(name: ""),
        img: json["img"] != null ? json["img"] : "assets/capuche.jpg",
      );
}
