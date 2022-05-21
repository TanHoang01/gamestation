import 'dart:ffi';

class ProductModel {
  String? id;
  String? name;
  String? description;
  String? type;
  double? price;
  int? amount;
  bool? isHot;
  bool? isNew;
  List<String>? image;

  ProductModel({this.id, this.name, this.description, this.type, this.price, this.amount, this.image, this.isHot, this.isNew});

  // receiving data from server
  factory ProductModel.fromMap(map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      type: map['type'],
      price: map['price'],
      amount: map['amount'],
      isHot: map['isHot'],
      isNew: map['isNew'],
      image: map['image'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'price': price,
      'amount': amount,
      'isHot': isHot,
      'isNew': isNew,
      'image': image,
      
    };
  }
}