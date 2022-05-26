// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      json['userid'] as String,
      json['productid'] as String,
      json['amount'] as int,
     
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'userid': instance.userid,
      'productid': instance.productid,
      'amount': instance.amount,
    };