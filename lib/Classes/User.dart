class User {
  String email;
  String firstname;
  String lastname;

  User({this.email = "", this.firstname = "", this.lastname = ""});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }
}
