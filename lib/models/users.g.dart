// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['uid'] as String,
      json['fullname'] as String,
      json['email'] as String,
      json['address'] as String,
      json['phonenumber'] as String,
      (json['favoritelist'] as List<dynamic>).map((e) => e as String).toList(),
      json['messageId'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'fullname': instance.fullname,
      'email': instance.email,
      'address': instance.address,
      'phonenumber': instance.phonenumber,
      'favoritelist': instance.favoritelist,
      'messageId':instance.messageId,
    };