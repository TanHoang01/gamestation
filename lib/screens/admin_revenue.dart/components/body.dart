import 'package:flutter/material.dart';
import 'package:gamestation/models/bills.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.list,
    
  }) : super(key: key);
  final List<Bill> list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
              columns: [
                DataColumn(
                  label: Text("DateTime",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                 DataColumn(
                  label: Text("Total",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                 DataColumn(
                  label: Text("Bill Detail",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                 DataColumn(
                  label: Text("Paid By",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
              ],
              rows:List<DataRow>.generate(list.length, (index) =>  
                DataRow(
                  cells: [
                    DataCell (
                      Text(list[index].datetime.toString()),
                    ),
                    DataCell (
                      Text("\$" + list[index].total.toString()),
                    ),
                    DataCell (
                      Text(list[index].detail),
                    ),
                    DataCell (
                      Text(list[index].username),
                    ),
                  ]
                ),
              
            ),
    ));   
  }
}