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
    return Column(
      // children: [  
      //   FutureBuilder<List<Product>>(
      //         future: Products.getProductsHot(),
      //         builder: (context, snapshot) {
      //           final List<Product>? examQuestions = snapshot.data;

      //           switch (snapshot.connectionState) {
      //             case ConnectionState.waiting:
      //               return Center(child: CircularProgressIndicator());
      //             default:
      //               if (snapshot.hasError)
      //                 return Center(child: Text(snapshot.error.toString()));
      //               else if(examQuestions != null)
      //                 return buildproduct(examQuestions);
      //               else return Text("null");
      //           }
      //         },
      //       ),    
      // ]
    );
  }
}