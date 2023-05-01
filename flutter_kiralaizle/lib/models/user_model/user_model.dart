// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String usergoryModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.id,
        required this.name,
        this.image,
        required this.email,
    });

    String id;
    String name;
    String? image;
    String email;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "email":email,
    };
}
