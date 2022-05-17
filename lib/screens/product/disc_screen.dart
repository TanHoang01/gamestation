import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamestation/screens/details/details_screen.dart';
import 'package:gamestation/screens/cart/cart_screen.dart';
import 'package:gamestation/models/products.dart';
import 'package:gamestation/models/product_model.dart';
import 'package:gamestation/screens/home/home_screen.dart';

import 'components/product_card.dart';

class Disc_Screen extends StatefulWidget {
  @override
  _Disc_Screen createState() => _Disc_Screen();
}

class _Disc_Screen extends State<Disc_Screen> {
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
                              HomeScreen(),
              ));
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
        title: Center(child: Text('Game Dics', textAlign: TextAlign.center, style: TextStyle(color: primaryColor),)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart,
                       color: iconColor,
                       size: 30.0,),
            onPressed: () {
              // Navigator.push(
              //           context,
              //          MaterialPageRoute(
              //             builder: (context) =>
              //                 CartScreen(),
              // ));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<List<Product>>(
              future: Products.getProductsDics(),
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
            ),         
        ],
      )
    );
  }
  Widget buildproduct(List<Product> list) {
    return SizedBox(
    height: 180,
    width: double.infinity,
    child: Container( 
        decoration: BoxDecoration(color: barColor),
        child: GridView.count(
        crossAxisCount: 2,
        children: 
        List.generate(
          list.length,
            (index) => Padding(
              padding: const EdgeInsets.all( defaultPadding/2),
              child: ProductCard(
                title: list[index].name,
                image: list[index].image[0],
                price: list[index].price,
                bgColor: bgColor,
                press: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: list[index]),
                        ));
                  },
                ),
              ),
            ),
        )
      )
    );
  }
}