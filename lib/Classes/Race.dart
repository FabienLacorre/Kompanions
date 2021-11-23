class Race {
  String name;

  Race({this.name = ""});

  factory Race.fromJson(Map<String, dynamic> json) => Race(
        name: json["name"] != null ? json["name"] : "",
      );
}
