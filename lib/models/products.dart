import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
part 'products.g.dart';
@JsonSerializable()
class Product {
  final String id;
  final String name,type, description;
  final double price;
  final int amount;
  final List<String> image;
  final bool isHot, isNew;

  Product(
    this.id,
    this.name,
    this.type,
    this.image,
    this.description,
    this.price,
    this.amount,
    this.isHot,
    this.isNew,
  );

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}