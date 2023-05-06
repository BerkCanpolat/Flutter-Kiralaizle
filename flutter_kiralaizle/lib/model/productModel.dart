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
        this.qty,
    });

    String? id;
    String? name;
    String? image;
    double? price;
    String? status;
    String? description;
    bool? isFavourite;

    int? qty;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: double.parse(json["price"].toString()),
        description: json["description"],
        status: json["status"],
        isFavourite: false,
        qty: json["qty"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "description": description,
        "status": status,
        "isFavourite": isFavourite,
        "qty": qty,
    };

    @override
    ProductModel copyWith({
      int? qty,
    }) => 
    ProductModel(
        id: id,
        name: name,
        image: image,
        price: price,
        description: description,
        status: status,
        isFavourite: isFavourite,
        qty: qty ?? this.qty,
    );
}
