import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'bills.g.dart';
@JsonSerializable()
class Bill {
  final String username,detail;
  final DateTime datetime;
  final double total;
  

  Bill(
    this.username,
    this.datetime,
    this.total,
    this.detail
  );

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

  Map<String, dynamic> toJson() => _$BillToJson(this);
}