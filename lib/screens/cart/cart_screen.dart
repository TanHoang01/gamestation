import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/controllers/firebase.dart';
import 'package:gamestation/models/cart_model.dart';
import 'package:gamestation/models/users.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  State<CartScreen> createState() => _CartScreen();
}
class _CartScreen extends State<CartScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
       actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart,
                       color: primaryColor,
                       size: 30.0,),
            onPressed: null,
          ),
        ],
    );
  }
}