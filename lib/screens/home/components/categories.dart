import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamestation/models/category.dart';
import 'package:gamestation/screens/product/playstation_screen.dart';
import 'package:gamestation/screens/product/xbox_screen.dart';
import 'package:gamestation/screens/product/switch_screen.dart';
import 'package:gamestation/screens/product/disc_screen.dart';

import '../../../constants.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: demo_categories.length,
        itemBuilder: (context, index) => CategoryCard(
          icon: demo_categories[index].icon,
          title: demo_categories[index].title,
          press: () {
            if(index == 0) {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          PlayStation(),
                    ));
            }
            else if(index == 1) {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          Xbox(),
                    ));
            }
            else if(index == 2) {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          Switch_Screen(),
                    ));
            }
            else if(index == 3) {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          Disc_Screen(),
                    ));
            }
          },
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(width: defaultPadding),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}