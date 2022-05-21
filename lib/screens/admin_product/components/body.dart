import 'package:flutter/material.dart';
import 'package:gamestation/models/products.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.list,
    
  }) : super(key: key);
  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
              columns: [
                DataColumn(
                  label: Text("ID",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                 DataColumn(
                  label: Text("Image",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                 DataColumn(
                  label: Text("Name",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                 DataColumn(
                  label: Text("Type",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                DataColumn(
                  label: Text("Price",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                DataColumn(
                  label: Text("Amount",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                DataColumn(
                  label: Text("Hot",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                DataColumn(
                  label: Text("New",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
              ],
              rows:List<DataRow>.generate(list.length, (index) =>  
                DataRow(
                  cells: [
                    DataCell (
                      Text(list[index].productcode),
                    ),
                    DataCell (
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                        color: bgColor,
                        ),
                        child: Image.network(
                          list[index].image[0],
                          height: 100,
                          ),
                        ),
                      ),
                    DataCell (
                      Text(list[index].name),
                    ),
                    DataCell (
                      Text(list[index].type),
                    ),
                    DataCell (
                      Text(list[index].price.toString()),
                    ),
                    DataCell (
                      Text(list[index].amount.toString()),
                    ),
                    DataCell (
                      Text(list[index].isHot.toString()),
                    ),
                    DataCell (
                      Text(list[index].isNew.toString()),
                    ),
                  ]
                ),
              
            ),
    ));   
  }
}