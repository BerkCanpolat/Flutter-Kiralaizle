// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? id;
    String? name;
    String? email;
    String? image;

    UserModel({
        this.image,
        required this.id,
        required this.name,
        required this.email,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
    };


    UserModel copyWith({
    String? name,image,
    }) => 
    UserModel(
        id: id,
        name: name??this.name,
        image: image??this.image,
        email: email,
    );
}
