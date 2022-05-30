// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      json['username'] as String,
      (json['datetime'] as Timestamp).toDate(),
      json['total'] as double,
      json['detail'] as String
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'username': instance.username,
      'datetime': instance.datetime,
      'total': instance.total,
      'detail': instance.detail,
    };