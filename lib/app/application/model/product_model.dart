// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_store_app/app/application/export.dart';

class ProductModel {
  int id;
  String category;
  String name;
  String descrpition;
  double price;
  int qty;
  String image;
  String type;
  int rating;
  bool favorite;
  bool outStock;
  String createAt;

  ProductModel({
    required this.id,
    required this.category,
    required this.name,
    required this.descrpition,
    required this.price,
    required this.qty,
    required this.image,
    required this.type,
    required this.rating,
    required this.favorite,
    required this.outStock,
    required this.createAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ProductKey.id: id,
      ProductKey.category: category,
      ProductKey.name: name,
      ProductKey.descrpition: descrpition,
      ProductKey.price: price,
      ProductKey.qty: qty,
      ProductKey.image: image,
      ProductKey.type: type,
      ProductKey.rating: rating,
      ProductKey.favorite: favorite,
      ProductKey.outStock: outStock,
      ProductKey.createAt: createAt,
    };
  }


  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map[ProductKey.id] as int,
      category: map[ProductKey.category] as String,
      name: map[ProductKey.name] as String,
      descrpition: map[ProductKey.descrpition] as String,
      price: map[ProductKey.price] as double,
      qty: map[ProductKey.qty] as int,
      image: map[ProductKey.image] as String,
      type: map[ProductKey.type] as String,
      rating: map[ProductKey.rating] as int,
      favorite: map[ProductKey.favorite] as bool,
      outStock: map[ProductKey.outStock] as bool,
      createAt: map[ProductKey.createAt] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
