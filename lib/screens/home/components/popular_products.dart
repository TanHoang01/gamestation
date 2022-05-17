import 'package:flutter/material.dart';
import 'package:gamestation/models/products.dart';
import 'package:gamestation/models/product_model.dart';
import 'package:gamestation/screens/details/details_screen.dart';
import 'package:gamestation/screens/product/popular_screen.dart';

import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Popular",
            pressSeeAll: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          Popular_Screen(),
                    ));
            },
          ),
        ),
            FutureBuilder<List<Product>>(
              future: Products.getProductsHot(),
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
    );
  }
  Widget buildproduct(List<Product> list) {
    return SizedBox(
    height: 180,
    width: double.infinity,
    child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: 
              (context,index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
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
            )
    );
  }
}