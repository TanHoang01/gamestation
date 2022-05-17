// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as String,
      json['name'] as String,
      json['type'] as String,
      (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      json['description'] as String,
      (json['price'] as num).toDouble(),
      json['amount'] as int,
      json['isHot'] as bool,
      json['isNew'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'price': instance.price,
      'amount': instance.amount,
      'image': instance.image,
      'isHot': instance.isHot,
      'isNew': instance.isNew,
    };
