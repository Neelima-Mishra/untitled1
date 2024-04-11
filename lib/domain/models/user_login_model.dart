class UserData {
  UserData({
    this.id,
    this.username,
    this.email,
    this.birthday,
    this.location,
    this.description,
    this.hobbies,
    this.accessToken,
  });

  int? id;
  String? username;
  String? email;
  String? birthday;
  String? location;
  String? description;
  String? hobbies;
  String? accessToken;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        username: json["username"] ?? "",
        email: json["email"],
        birthday: json["birthday"] ?? "",
        location: json["location"] ?? "",
        description: json["description"] ?? "",
        hobbies: json["hobbies"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "birthday": birthday,
        "location": location,
        "description": description,
        "hobbies": hobbies,
        "access_token": accessToken,
      };
}
