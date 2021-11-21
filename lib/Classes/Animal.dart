class Animal {
  final int userId;
  final int id;

  Animal({
    required this.userId,
    required this.id,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        userId: json["userId"],
        id: json["id"],
      );
}
