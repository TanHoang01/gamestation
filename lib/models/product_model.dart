import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'users_model.dart';
import 'users.dart';
import 'products.dart';

class Products {
  static Future<List<Product>> getProductsHot() async {
  final snapshot = await FirebaseFirestore.instance.collection("products").where("isHot",isEqualTo: true).get();
  return snapshot.docs.map((e) {
      print(e.data());
      return Product.fromJson(e.data());
    }
  ).toList();
}
 
  static Future<List<Product>> getProductsNew() async {
  final snapshot = await FirebaseFirestore.instance.collection("products").where("isNew",isEqualTo: true).get();
  return snapshot.docs.map((e) {
      print(e.data());
      return Product.fromJson(e.data());
    }
  ).toList();
}

  static Future<List<Product>> getProductsCnA() async {
  final snapshot = await FirebaseFirestore.instance.collection("products").where("type",isEqualTo: "others").get();
  return snapshot.docs.map((e) {
      print(e.data());
      return Product.fromJson(e.data());
    }
  ).toList();
}

  static Future<List<Product>> getProductsPS() async {
  final snapshot = await FirebaseFirestore.instance.collection("products").where("type",isEqualTo: "playstation").get();
  return snapshot.docs.map((e) {
      print(e.data());
      return Product.fromJson(e.data());
    }
  ).toList();
}

  static Future<List<Product>> getProductsXbox() async {
  final snapshot = await FirebaseFirestore.instance.collection("products").where("type",isEqualTo: "xbox").get();
  return snapshot.docs.map((e) {
      print(e.data());
      return Product.fromJson(e.data());
    }
  ).toList();
}

  static Future<List<Product>> getProductsNS() async {
  final snapshot = await FirebaseFirestore.instance.collection("products").where("type",isEqualTo: "switch").get();
  return snapshot.docs.map((e) {
      print(e.data());
      return Product.fromJson(e.data());
    }
  ).toList();
}

  static Future<List<Product>> getProductsDics() async {
  final snapshot = await FirebaseFirestore.instance.collection("products").where("type",isEqualTo: "dics").get();
  return snapshot.docs.map((e) {
      print(e.data());
      return Product.fromJson(e.data());
    }
  ).toList();
}

 static Future<List<Product>> getProducts() async {
  final snapshot = await FirebaseFirestore.instance.collection("products").get();
  return snapshot.docs.map((e) {
      print(e.data());
      return Product.fromJson(e.data());
    }
  ).toList();
}

static Future<bool> checkProductbyid(String id) async {
  final snapshot = await FirebaseFirestore.instance.collection("products").where("id",isEqualTo: id).get();  
   if( snapshot.docs.map((e) {
      print(e.data());
      return Product.fromJson(e.data());
    }
  ).toList().length == 0)
  return false;
  else return true;
}

 static Future<List<String>> getProductsbyid(String id) async {
  final snapshot = await FirebaseFirestore.instance.collection("products").doc(id).get();
  return Product.fromJson(snapshot.data()!).image;
}

static Future<List<Product>> getFavoriteProducts() async {
  User user = await Users.getUserInst(auth.FirebaseAuth.instance.currentUser!.uid);
  List<String> favorite = user.favoritelist;
  final snapshot = await FirebaseFirestore.instance.collection("products").get();
  List<Product> products = snapshot.docs.map((e) {
      print(e.data());
      return Product.fromJson(e.data());
    }
  ).toList();
  List<Product> favoriteproducts = products.where((element) => favorite.contains(element.id)).toList();
  return favoriteproducts; 
}
//  static Future setProducts() async {
//   final docs = await FirebaseFirestore.instance.collection("products").doc();
  
//   Product products = Product(docs.id.toString(),"Ps4","ps4",["https://m.media-amazon.com/images/I/61n-yWHcmSS._AC_SX355_.jpg","https://m.media-amazon.com/images/I/61n-yWHcmSS._AC_SX355_.jpg"],"dghghg",true,true);
//   await docs.set(products.toJson());
// }
}