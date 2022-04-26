import 'package:flutter/material.dart';
import 'package:gamestation/models/product.dart';
import 'package:gamestation/screens/details/details_screen.dart';
import 'package:gamestation/screens/product/controller_screen.dart';

import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class ControllerandAccessory extends StatelessWidget {
  const ControllerandAccessory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Controller & Accessory",
            pressSeeAll: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          Controller_Screen(),
                    ));
            },
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              demo_product.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
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
          ),
        )
      ],
    );
  }
}