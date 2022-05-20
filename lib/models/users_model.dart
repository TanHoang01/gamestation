import 'package:cloud_firestore/cloud_firestore.dart';
import 'users.dart';

class Users {
  static Future<User> getUserInst(String uid) async {
  final snapshot = await FirebaseFirestore.instance.collection("users").doc(uid).get();
  return User.fromJson(snapshot.data()!);
}

 static Future Inst(String uid, String productid) async {
  final snapshot = await FirebaseFirestore.instance.collection("users").doc(uid).get();
  final user = User.fromJson(snapshot.data()!);
 
if(user.favoritelist.contains(productid)) {
  user.favoritelist.remove(productid);
   await FirebaseFirestore.instance.collection("users").doc(uid).set(user.toJson());
  }
else{
   user.favoritelist.add(productid);
    await FirebaseFirestore.instance.collection("users").doc(uid).set(user.toJson());
  } 
}

  static Future<List<User>> getUser() async {
  final snapshot = await FirebaseFirestore.instance.collection("users").get();
   return snapshot.docs.map((e) {
      return User.fromJson(e.data());
    }
  ).toList();
}


}