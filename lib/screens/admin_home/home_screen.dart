import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gamestation/models/users.dart';
import 'package:gamestation/models/users_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/controllers/firebase.dart';
import 'package:gamestation/screens/admin_customer/customer_list_screen.dart';
import 'package:gamestation/screens/admin_product/product_list_screen.dart';
import 'components/alert_dialog.dart';

class HomeScreenad extends StatefulWidget {
  @override
  _HomeScreenadState createState() => _HomeScreenadState();
}

class _HomeScreenadState extends State<HomeScreenad> {

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
                 FutureBuilder<User>(
                    future: Users.getUserInst(auth.FirebaseAuth.instance.currentUser!.uid),
                    builder: (context, snapshot) {
                    final User? examQuestions = snapshot.data;
                    switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                    default:
                    if (snapshot.hasError)
                      return Center(child: Text(snapshot.error.toString()));
                    else if(examQuestions != null)
                      return builduser(examQuestions);
                    else return Text("null");
                }
              },
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
                              HomeScreenad(),
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
                              HomeScreenad(),
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
  Widget builduser(User user) {
    return Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 62,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/logo.png"),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            user.fullname,
                            style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold,letterSpacing: 2),
                            
                          ),
                          Text('Admin',style: TextStyle(color: Colors.black,fontSize: 16.0),)
                        ],
                      )
                    ],
                  ),
                );                                
  }
}