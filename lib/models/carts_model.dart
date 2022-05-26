import 'dart:ffi';

class CartModel {
  String? productid;
  String? userid;
  int? amount;

  CartModel({this.productid, this.userid, this.amount,});

  // receiving data from server
  factory CartModel.fromMap(map) {
    return CartModel(
      productid: map['productid'],
      userid: map['userid'],
      amount: map['amount'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'productid': productid,
      'userid': userid,
      'amount': amount,      
    };
  }
}