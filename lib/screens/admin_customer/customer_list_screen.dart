import 'components/body.dart';
import 'package:gamestation/screens/admin_home/home_screen.dart';
import 'package:gamestation/models/users.dart';
import 'package:gamestation/models/users_model.dart';
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
                                  HomeScreenad(),
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
        body: ListView(
          children: [
             FutureBuilder<List<User>>(
              future: Users.getUser(),
              builder: (context, snapshot) {
                final List<User>? examQuestions = snapshot.data;

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
        ]
      ),
    );
  }
   Widget buildproduct(List<User> list) {
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