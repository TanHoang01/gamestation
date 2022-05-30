import 'dart:ffi';

class BillModel {
  String? username;
  DateTime? dateTime;
  double? total;
  String? detail;

  BillModel({this.username, this.dateTime, this.total, this.detail});

  // receiving data from server
  factory BillModel.fromMap(map) {
    return BillModel(
      username: map['username'],
      dateTime: map['datetime'],
      total: map['total'],
      detail: map['detail']
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'dateTime': dateTime,
      'total': total,  
      'detail': detail,    
    };
  }
}