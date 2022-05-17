import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/models/products.dart';
import 'package:gamestation/screens/details/details_screen.dart';
import 'components/product_card.dart';

class Favorite extends StatefulWidget {
  @override
  _Favorite createState() => _Favorite();
}

class _Favorite extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Container( 
        decoration: BoxDecoration(color: barColor),
        child: GridView.count(
      crossAxisCount: 2, 
        )
      );
  }
}