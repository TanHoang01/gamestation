import 'package:flutter/material.dart';
import 'package:gamestation/models/cart.dart';
import 'package:gamestation/constants.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
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
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
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