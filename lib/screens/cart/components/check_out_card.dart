import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamestation/controllers/firebase.dart';
import 'package:gamestation/models/products.dart';
import 'package:gamestation/models/cart_model.dart';
import 'package:gamestation/default_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamestation/models/bills_model.dart';
import 'package:gamestation/models/cart_model.dart';
import 'package:gamestation/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
              future: Carts.getCartProducts(),
              builder: (context, snapshot) {
                final List<Product>? examQuestions = snapshot.data;

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError)
                      return Center(child: Text(snapshot.error.toString()));
                    else if(examQuestions != null)
                      return buildproduct(examQuestions);
                    else return Text("null");
                }
              },
            );  
  }

   Widget buildproduct(List<Product> list) {
    double total = 0; 
    for(int i = 0; i<list.length ;i++) {
      total = total + list[i].price * list[i].amount;
    }
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$" + total.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 190,
                  child: DefaultButton(
                    text: "Check Out",
                    press: () async {
                      List<String> listid = await add(list);
                      listid.forEach((element) => remove(auth.FirebaseAuth.instance.currentUser!.uid + element));
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future <List<String>> add(List<Product> list) async {  
      try {
        return postDetailsToFirestore(list);
      } on FirebaseException catch (error){
        return [];
      }
  }

  Future<List<String>> postDetailsToFirestore(List<Product> list) async {
    // calling our firestore
    // calling our user model
    // sedning these values
    double total = 0; 
    String detail = "";
    for(int i = 0; i<list.length ;i++) {
      total = total + list[i].price * list[i].amount;
      detail = detail + "Product name: " + list[i].name + " -" + " Amount: " + list[i].amount.toString() + " / ";
    }

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    BillModel billModel = BillModel();

    // writing all the values
    billModel.username = (await Users.getUserInst(auth.FirebaseAuth.instance.currentUser!.uid)).fullname;
    billModel.datetime = DateTime.now();
    billModel.total = total;
    billModel.detail = detail;
    await firebaseFirestore
        .collection("bills")
        .doc()
        .set(billModel.toMap());
    Fluttertoast.showToast(msg: "Bill created successfully :) ");
    return list.map((e) => e.id).toList();
  }

   void remove(String listid) async { 
      try {
        deleteDetailsToFirestore(listid);
      } on FirebaseException catch (error){}
    }

  deleteDetailsToFirestore(String listid) async {

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection("cart")
        .doc(listid)
        .delete();
  }
}