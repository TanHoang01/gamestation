import 'package:gamestation/screens/admin_customer/page/page.dart';
import 'package:gamestation/screens/admin_customer/widget/tabbar_widget.dart';
import 'package:gamestation/screens/admin_home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamestation/constants.dart';

class CustomerScreen extends StatefulWidget {
  @override
  _CustomerScreen createState() => _CustomerScreen();
}

class _CustomerScreen extends State<CustomerScreen> {
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
            title: Center(child: Text('Customer List', textAlign: TextAlign.center, style: TextStyle(color: primaryColor),)),
            actions: [
                 Icon(Icons.shopping_cart,
                          color: barColor,
                          size: 30.0,),
            ],
          ),    
        body: SortablePage(),
    );
  }
}