import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
part 'users.g.dart';
@JsonSerializable()
class User {
  final String uid,fullname,email,address,phonenumber;

  User(
    this.uid,
    this.fullname,
    this.email,
    this.address,
    this.phonenumber,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}