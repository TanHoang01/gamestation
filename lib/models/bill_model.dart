import 'package:cloud_firestore/cloud_firestore.dart';
import 'bills.dart';

class Bills {
  static Future<List<Bill>> getBill() async {
  final snapshot = await FirebaseFirestore.instance.collection("bills").get();
   return snapshot.docs.map((e) {
      return Bill.fromJson(e.data());
    }
  ).toList();
  }
}