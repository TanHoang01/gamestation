import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
part 'carts.g.dart';
@JsonSerializable()
class Cart {
  final String productid,userid;
  final int amount;
  

  Cart(
    this.userid,
    this.productid,
    this.amount,
   
  );

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}