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
    TableRow tableRow = TableRow(
      children: <Widget> [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Full Name"),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Email"),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Phone Number"),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Address"),
        )
      ]
    );
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
        body: Column(
          children: [
            Container(padding: const EdgeInsets.only(right: defaultPadding/2, left: defaultPadding/2),
            child:Table(
              border: TableBorder.all(),
              children: <TableRow> [
                tableRow,
              ]
            ),
            ),
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
                      return builduser(examQuestions);
                    else return Text("null");
                }
              },
            ),            
        ]),
    );
  }
   Widget builduser(List<User> list) {
    return SizedBox(
    height: 600,
    width: double.infinity,
      child: ListView.builder(
              itemCount: list.length,
              itemBuilder: 
              (context,index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding/2, left: defaultPadding/2),
                child: Body(
                  name: list[index].fullname,
                  email: list[index].email,
                  phonenumber: list[index].phonenumber,
                  address: list[index].address,
                ),
              ),
            )     
    );
  }  
}