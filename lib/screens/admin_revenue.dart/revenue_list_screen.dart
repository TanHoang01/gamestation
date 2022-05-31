import 'package:gamestation/models/bill_model.dart';
import 'package:gamestation/screens/admin_revenue.dart/revenue_chart.dart';

import 'components/body.dart';
import 'package:gamestation/screens/admin_home/home_screen.dart';
import 'package:gamestation/models/bills.dart';
import 'package:gamestation/models/bills_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamestation/constants.dart';

class RevenueScreen extends StatefulWidget {
  @override
  _RevenueScreen createState() => _RevenueScreen();
}

class _RevenueScreen extends State<RevenueScreen> { 
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
            title: Center(child: Text('Revenue detail', textAlign: TextAlign.center, style: TextStyle(color: primaryColor),)),
            actions: [
                IconButton(
                  icon: Icon(Icons.map_outlined,
                            color: iconColor,
                            size: 25.0,),
                    onPressed: () {
                      Navigator.push(
                                context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChartScreen(),
                      ));
                    },
                  ),
            ],
          ),    
        body: ListView(
          children: [
             FutureBuilder<List<Bill>>(
              future: Bills.getBill(),
              builder: (context, snapshot) {
                final List<Bill>? examQuestions = snapshot.data;

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError)
                      return Center(child: Text(snapshot.error.toString()));
                    else if(examQuestions != null)
                      return buildbill(examQuestions);
                    else return Text("null");
                }
              },
            ),            
        ]
      ),
    );
  }
   Widget buildbill(List<Bill> list) {
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