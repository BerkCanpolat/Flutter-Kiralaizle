// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        required this.id,
        required this.name,
        required this.image,
        required this.price,
        required this.description,
        required this.status,
        required this.isFavourite,
    });

    String? id;
    String? image;
    String? name;
    double? price;
    String? description;
    String? status;
    bool? isFavourite;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: double.parse(json["price"].toString()),
        description: json["description"],
        status: json["status"],
        isFavourite: false,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "description": description,
        "status": status,
    };
}
