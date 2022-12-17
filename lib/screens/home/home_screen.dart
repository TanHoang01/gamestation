import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/models/product_model.dart';
import 'package:gamestation/screens/cart/cart_screen.dart';
import 'package:gamestation/screens/cart/components/body.dart';
import 'package:gamestation/screens/chat/chat_client.dart';
import 'package:gamestation/screens/chat/chat_screen_detail.dart';
import 'package:gamestation/screens/navigation_social/navigationBar.dart';
import 'package:gamestation/screens/profile/profile_screen.dart';
import 'package:gamestation/screens/chat/chat_screen.dart';
import 'package:gamestation/screens/favorite/favorite_screen.dart';
import 'package:gamestation/screens/search/search_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import '../dashboard/dashboard.dart';
import 'components/categories.dart';
import 'components/new_arrival_products.dart';
import 'components/popular_products.dart';
import 'components/controller_and_accessory.dart';
import 'package:sticky_float_button/sticky_float_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _index = 0;
  final searchController = new TextEditingController();
  List<Widget> tabPages = [Home(), Favorite(), messageClientScreen(), Profile()];
  String uid='';
  @override
  void initState() {
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _bottomTab() {
      return BottomNavigationBar(
        currentIndex: _index,
        onTap: (int index) => setState(() => _index = index),
        backgroundColor: barColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: iconColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              label: "Home", 
              backgroundColor: barColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              backgroundColor: barColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Chat",
              backgroundColor: barColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: barColor),
        ],
      );
    }

    return Scaffold(
        backgroundColor: barColor,
        appBar: AppBar(
          backgroundColor: barColor,
          leading: IconButton(
            onPressed: null,
            icon: SvgPicture.asset("assets/icons/logo.svg"),
          ),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search, color: iconColor),
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Search_Screen(search_name: searchController.text),
                        ));
                      }
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear, color: iconColor),
                      onPressed: () {
                        searchController.clear();
                      },
                    ),
                    hintText: 'Search items...',
                    border: InputBorder.none),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: iconColor,
                size: 30.0,
              ),
              onPressed: () {               
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
            ),
          ],
        ),
        body: Builder(
         builder: (context) {
           return Stack(children: [
            tabPages[_index],
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 12,bottom: 12),
              child: GestureDetector(
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>navigationBar(required,uid: uid,)));
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),                
                  child: StickyFloatButton(
                     child: CircleAvatar(
                         backgroundColor: primaryColor,
                         child: Icon(
                              Iconsax.personalcard5,
                              color: Colors.white,
                              size: 30,
                              shadows: [
                                
                              ],
                         ),
                     ),
                   ),
                ),
              ),
            )
          ]);}
        ),
        bottomNavigationBar: _bottomTab());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Categories(),
          const PopularProducts(),
          const NewArrivalProducts(),
          const ControllerandAccessory(),
        ],
      ),
    );
  }
}
