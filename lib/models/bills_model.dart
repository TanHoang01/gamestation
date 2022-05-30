import 'dart:ffi';

class BillModel {
  String? username;
  DateTime? datetime;
  double? total;
  String? detail;

  BillModel({this.username, this.datetime, this.total, this.detail});

  // receiving data from server
  factory BillModel.fromMap(map) {
    return BillModel(
      username: map['username'],
      datetime: map['datetime'],
      total: map['total'],
      detail: map['detail']
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'datetime': datetime,
      'total': total,  
      'detail': detail,    
    };
  }
}