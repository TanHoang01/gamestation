import 'package:cloud_firestore/cloud_firestore.dart';
import 'users.dart';

class Users {
  static Future<User> getUserInst(String uid) async {
  final snapshot = await FirebaseFirestore.instance.collection("users").doc(uid).get();
  return User.fromJson(snapshot.data()!);
}

}