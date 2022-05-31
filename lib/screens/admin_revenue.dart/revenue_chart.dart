import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/models/bills.dart';
import 'package:gamestation/models/bill_model.dart';

class ChartScreen extends StatefulWidget {
  ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      onPressed: () { 
                       setState(() {
                         
                       });
                      }
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear, color: iconColor),
                      onPressed: () {
                        searchController.clear();
                      },
                    ),
                    hintText: 'Which year chart...',
                    border: InputBorder.none),
              ),
            ),
          ),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: FutureBuilder<List<Bill>>(
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
    );
  }
  
  Widget buildbill(List<Bill> list) {
    double jan = 0,feb = 0,mar = 0,apr = 0,may = 0,jun = 0,
         jul = 0,agu = 0,sep = 0,oct = 0,nov = 0,dec = 0;
  for(int i = 0;i<list.length;i++) {

    if(list[i].datetime.year.toString()== searchController.text && list[i].datetime.month == 1){
      jan = jan + list[i].total;    
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 2){
      feb = feb + list[i].total;
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 3){
      mar = mar + list[i].total;
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 4){
      apr = apr + list[i].total;
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 5){
      may = may + list[i].total.toDouble();
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 6){
      jun = jun + list[i].total;
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 7){
      jul = jul + list[i].total;
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 8){
      agu = agu + list[i].total;
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 9){
      sep = sep + list[i].total;
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 10){
      oct = oct + list[i].total;
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 11){
      nov = nov + list[i].total;
    }
    if(list[i].datetime.year.toString() == searchController.text && list[i].datetime.month == 12){
      dec = dec + list[i].total;
    }
  } 

    final List<BarChartModel> data = [
    BarChartModel(
      month: "Jan",
      financial: jan,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartModel(
      month: "Feb",
      financial: feb,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      month: "Mar",
      financial: mar,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      month: "Apr",
      financial: apr,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModel(
      month: "May",
      financial: may,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      month: "Jun",
      financial: jun,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      month: "Jul",
      financial: jul,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
    BarChartModel(
      month: "Aug",
      financial: agu,
      color: charts.ColorUtil.fromDartColor(Colors.orange),
    ),
    BarChartModel(
      month: "Sep",
      financial: sep,
      color: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    BarChartModel(
      month: "Oct",
      financial: oct,
      color: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
    BarChartModel(
      month: "Nov",
      financial: nov,
      color: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    BarChartModel(
      month: "Dec",
      financial: dec,
      color: charts.ColorUtil.fromDartColor(Colors.tealAccent),
    ),
  ];
  List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.month,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      );
  }
}
class BarChartModel {
  String month;
  double financial;
  final charts.Color color;

  BarChartModel({
    required this.month,
    required this.financial,
    required this.color,
  });
}