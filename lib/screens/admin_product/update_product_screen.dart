import 'package:flutter/material.dart';
import '../../../constants.dart';

import 'components/update_product_form.dart';
import 'product_list_screen.dart';

class UpdateProductScreen extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: barColor,
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                            context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductScreen(),
                  ));
              },
              icon: Icon(Icons.arrow_back,color: Colors.black,),
            ),
            title: Center(child: Text('Update Product', textAlign: TextAlign.center, style: TextStyle(color: primaryColor),)),
            actions: [
                 Icon(Icons.shopping_cart,
                          color: barColor,
                          size: 30.0,),
            ],
      ),
      body: SafeArea(
       child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child:UpdateProductForm(),
        )
      ))
    )
    );
  }
}