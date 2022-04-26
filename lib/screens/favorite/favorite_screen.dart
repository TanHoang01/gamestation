import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/screens/details/details_screen.dart';
import 'package:gamestation/models/product.dart';
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
      crossAxisCount: 2, children: 
        List.generate(
          demo_product.length,
            (index) => Padding(
              padding: const EdgeInsets.all( defaultPadding/2),
              child: ProductCard(
                title: demo_product[index].title,
                image: demo_product[index].images[0],
                price: demo_product[index].price,
                bgColor: bgColor,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          DetailsScreen(product: demo_product[index]),
                    ));
                  },
                ),
              ),
            ),
        )
      );
  }
}