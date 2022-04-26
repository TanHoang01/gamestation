import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/screens/admin_customer/customer_list_screen.dart';
import 'package:gamestation/screens/admin_product/product_list_screen.dart';
import 'components/alert_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool tappedYes = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  height: 62,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 62,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Peter Parker',
                            style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold,letterSpacing: 2),
                            
                          ),
                          Text('Admin',style: TextStyle(color: Colors.black,fontSize: 16.0),)
                        ],
                      )
                    ],
                  ),
                ),            
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CustomerScreen(),
                          )),
                        child:  Card(
                          color: Color(0xFFBBDEFB),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset("assets/icons/customer.svg"),
                              SizedBox(height: 5.0,),
                              Text('Customers',style: TextStyle(fontSize: 20.0),),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductScreen(),
                          )),
                        child: Card(
                          color: Color(0xFFD7CCC8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset("assets/icons/product.svg"),
                                SizedBox(height: 5.0,),
                                Text('Products',style: TextStyle(fontSize: 20.0),),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(),
                          )),
                        child: Card(
                          color: Color(0xFFC8E6C9),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset("assets/icons/revenue.svg"),
                                SizedBox(height: 5.0,),
                                Text('Revenue',style: TextStyle(fontSize: 20.0),),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(),
                          )),
                        child: Card(
                          color: Color(0xFFF8BBD0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset("assets/icons/chat.svg"),
                                SizedBox(height: 5.0,),
                                Text('Chat',style: TextStyle(fontSize: 20.0),),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                        final action = await AlertDialogs.yesCancelDialog(context, 'Logout', 'Are you sure to quit?');
                        if(action == DialogsAction.yes) {
                          setState(() => tappedYes = true);
                        }
                      },
                        child: Card(
                          color: Color(0xFFFFE0B2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset("assets/icons/logout.svg"),
                                SizedBox(height: 5.0,),
                                Text('Log out',style: TextStyle(fontSize: 20.0),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}