import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/models/products.dart';
import '../../models/users_model.dart';
import 'components/color_dot.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Widget buildImage(String image, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      color: Colors.grey,
      child: Image.network(
        product.image[index],
        fit: BoxFit.cover,
      ),
    );
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              Users.Inst(FirebaseAuth.instance.currentUser!.uid,product.id);
            },
            icon: Icon(Icons.favorite, color: iconColor),
          )
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(height: MediaQuery.of(context).size.height * 0.4,),
            itemCount: product.image.length,
            itemBuilder: (context, index, realIndex){
              final image = product.image[index];
              return buildImage(image, index);
            }
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Color(0xFFEEEEEE),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                      Text(
                        "\$" + product.price.toString(),
                        style: TextStyle(height: 1.1, fontSize: 22, color: primaryColor ),
                       ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      product.description,
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Row(
                    children: [
                      Text(
                        "Amount",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Spacer(),
                      RawMaterialButton(
                        constraints: BoxConstraints.tight(Size(40, 40)) ,
                        onPressed: () {},
                        fillColor: Colors.white,
                        child: Icon(
                          Icons.remove,
                          size: 20,
                        ),
                        padding: const EdgeInsets.all(defaultPadding / 4),
                        shape: CircleBorder(),
                      ),
                      RawMaterialButton(
                        constraints: BoxConstraints.tight(Size(40, 40)) ,
                        onPressed: null,
                        fillColor: Colors.white,
                        child: Text(
                          "1",
                          style: const TextStyle(fontSize: 20),
                        ),
                        padding: const EdgeInsets.all(defaultPadding / 4),
                        shape: CircleBorder(),
                      ),
                      RawMaterialButton(
                        constraints: BoxConstraints.tight(Size(40, 40)) ,
                        onPressed: () {},
                        fillColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                        padding: const EdgeInsets.all(defaultPadding / 4),
                        shape: CircleBorder(),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: const StadiumBorder()),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}