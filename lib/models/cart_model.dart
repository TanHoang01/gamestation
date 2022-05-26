import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'users_model.dart';
import 'users.dart';
import 'products.dart';
import 'carts.dart';

class Carts {
  static Future<List<Product>> getCartProducts() async {
  User user = await Users.getUserInst(auth.FirebaseAuth.instance.currentUser!.uid);
  final snapshot = await FirebaseFirestore.instance.collection("cart").where("userid", isEqualTo: user.uid).get();
  List<Cart> carts = snapshot.docs.map((e) {
      print(e.data());
      return Cart.fromJson(e.data());
    }
  ).toList();
  final product = await FirebaseFirestore.instance.collection("products").get();
List<Product> cartproducts = product.docs.map((e) {
  return Product.fromJson(e.data());
}).toList();

return cartproducts.where((product) => carts.any((cart) {
  if(cart.productid == product.id){
    product.amount = cart.amount;
    return true;
  }
  else{ 
    return false;
  }
})).toList();
}
}
