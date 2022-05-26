import 'package:flutter/material.dart';
import 'package:gamestation/models/cart_model.dart';
import 'package:gamestation/models/carts.dart';

import '../../../constants.dart';


class CartCard extends StatelessWidget {
   const CartCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.amount,
  }) : super(key: key);
  final String image, title; 
  final double price;
  final int amount;
  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: borderColor)
    ),
    child: Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${price}   ",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: primaryColor),
                children: [
                  TextSpan(
                      text: " x${amount}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.only(right: 10.0),
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.swipe_left, size: 25),
                    ),
                  ]
                )
              )
            ]
          ),
        )
      ],
    ),
   );
  }
}