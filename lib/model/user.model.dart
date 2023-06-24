import 'dart:convert';

List<UserModel> theUsersFromModel(String str) => List<UserModel>.from(
      json.decode(str).map(
            (x) => UserModel.fromJson(x),
          ),
    );

String categoryToJson(List<UserModel> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class UserModel {
  String? id;
  String? name;
  String? email;
  int? age;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "age": age,
      };
}
