import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamestation/screens/details/details_screen.dart';
import 'package:gamestation/screens/cart/cart_screen.dart';
import 'package:gamestation/models/products.dart';
import 'package:gamestation/models/product_model.dart';
import 'package:gamestation/screens/home/home_screen.dart';

import 'components/product_card.dart';

class Search_Screen extends StatefulWidget {
  Search_Screen({Key? key, required this.search_name}) : super(key: key);

  final String search_name;

  @override
  _Search createState() => _Search();
}

class _Search extends State<Search_Screen> {
  List<Product> productSearchList=[];
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
        title: Center(child: Text(widget.search_name, textAlign: TextAlign.center, style: TextStyle(color: primaryColor),)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart,
                       color: iconColor,
                       size: 30.0,),
            onPressed: () {
              Navigator.push(
                        context,
                       MaterialPageRoute(
                          builder: (context) =>
                              CartScreen(),
              ));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<List<Product>>(
              future: Products.getProducts(),
              builder: (context, snapshot) {
                final List<Product>? examQuestions = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError)
                      return Center(child: Text(snapshot.error.toString()));
                    else if(examQuestions != null)
                    {
                      productSearchList.clear();
                      for(int i=0; i<examQuestions.length;i++)
                      {
                      if(widget.search_name.toLowerCase() == examQuestions[i].name.toLowerCase())
                      {
                      productSearchList.add(examQuestions[i]);
                      }
                      else
                        if(examQuestions[i].name.toLowerCase().contains(widget.search_name.toLowerCase()))
                        {
                        productSearchList.add(examQuestions[i]);
                        } 
                      }
                    return buildproduct(productSearchList);
                    }
                      
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