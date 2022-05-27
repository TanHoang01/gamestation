import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/models/products.dart';
import '../../models/users_model.dart';
import 'components/color_dot.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamestation/models/carts_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    Widget buildImage(String image, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      color: Colors.grey,
      child: Image.network(
        widget.product.image[index],
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
              Users.Inst(FirebaseAuth.instance.currentUser!.uid,widget.product.id);
            },
            icon: Icon(Icons.favorite, color: iconColor),
          )
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(height: MediaQuery.of(context).size.height * 0.4,),
            itemCount: widget.product.image.length,
            itemBuilder: (context, index, realIndex){
              final image = widget.product.image[index];
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
                          widget.product.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                      Text(
                        "\$" + widget.product.price.toString(),
                        style: TextStyle(height: 1.1, fontSize: 22, color: primaryColor ),
                       ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      widget.product.description,
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
                        onPressed: () {
                          if(amount > 1){
                            amount = amount - 1;
                            setState(() {
                            
                          });
                          }
                        },
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
                          amount.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        padding: const EdgeInsets.all(defaultPadding / 4),
                        shape: CircleBorder(),
                      ),
                      RawMaterialButton(
                        constraints: BoxConstraints.tight(Size(40, 40)) ,
                        onPressed: () {
                          amount = amount + 1;
                          setState(() {
                            
                          });
                        },
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
                        onPressed: () {
                          add();
                        },
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

   void add() async {
      try {
        postDetailsToFirestore();
      } on FirebaseException catch (error){
  
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    CartModel cartModel = CartModel();

    // writing all the values
    cartModel.productid = widget.product.id;
    cartModel.userid = auth.FirebaseAuth.instance.currentUser!.uid;
    cartModel.amount = amount;

    await firebaseFirestore
        .collection("cart")
        .doc(auth.FirebaseAuth.instance.currentUser!.uid + widget.product.id)
        .set(cartModel.toMap());
    Fluttertoast.showToast(msg: "Add to cart successfully :) ");
  }
}