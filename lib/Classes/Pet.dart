class Pet {
  final int id;
  final String name;
  final String type;
  final String img;

  Pet({
    required this.id,
    required this.name,
    required this.type,
    required this.img,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        img: json["img"],
      );
}
