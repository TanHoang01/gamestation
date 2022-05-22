import 'package:gamestation/models/products.dart';
import 'package:gamestation/models/product_model.dart';
import 'package:gamestation/screens/admin_home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamestation/constants.dart';
import 'components/body.dart';
import 'add_product_screen.dart';
import 'remove_product_screen.dart';
import 'update_product_screen.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreen createState() => _ProductScreen();
}

class _ProductScreen extends State<ProductScreen> {

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
                                  HomeScreenad(),
                  ));
              },
              icon: Icon(Icons.arrow_back,color: Colors.black,),
            ),
            title: Center(child: Text('Product List', textAlign: TextAlign.center, style: TextStyle(color: primaryColor),)),
            actions: [
                IconButton(
                  icon: Icon(Icons.edit,
                            color: iconColor,
                            size: 25.0,),
                    onPressed: () {
                      Navigator.push(
                                context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateProductScreen(),
                      ));
                    },
                  ),
                IconButton(
                  icon: Icon(Icons.remove,
                            color: iconColor,
                            size: 25.0,),
                    onPressed: () {
                      Navigator.push(
                                context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RemoveProductScreen(),
                      ));
                    },
                  ),
                  IconButton(
                icon: Icon(Icons.add,
                          color: iconColor,
                          size: 25.0,),
                onPressed: () {
                  Navigator.push(
                            context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddProductScreen(),
                  ));
                },
              ),
            ],
          ),    
        body: ListView(
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
    height: 630,
    width: double.infinity,
      child: Container(
        padding: const EdgeInsets.only(right: defaultPadding/2, left: defaultPadding/2),
        child: SingleChildScrollView(
                  child: Body(
                    list: list,
                  ),
              ),
      )     
    );
  }  
}