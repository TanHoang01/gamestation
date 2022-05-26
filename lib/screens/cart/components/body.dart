import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamestation/models/products.dart';
import 'package:gamestation/models/cart_model.dart';

import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
            );      ;
  }
  Widget buildproduct(List<Product> list) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(list[index].id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  Icon(Icons.delete,size: 30),
                ],
              ),
            ),
            child: CartCard(
              title: list[index].name,
              image: list[index].image[0],
              price: list[index].price,
              amount: list[index].amount,
            ),
          ),
        ),
      )
    );
  }
}