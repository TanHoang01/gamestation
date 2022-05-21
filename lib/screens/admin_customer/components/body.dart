import 'package:flutter/material.dart';
import 'package:gamestation/models/users.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.list,
    
  }) : super(key: key);
  final List<User> list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
              columns: [
                DataColumn(
                  label: Text("Name",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                 DataColumn(
                  label: Text("Email",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                 DataColumn(
                  label: Text("Phone Number",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
                 DataColumn(
                  label: Text("Address",
                  style: TextStyle(fontSize: 20, color: primaryColor)
                  )
                ),
              ],
              rows:List<DataRow>.generate(list.length, (index) =>  
                DataRow(
                  cells: [
                    DataCell (
                      Text(list[index].fullname),
                    ),
                    DataCell (
                      Text(list[index].email),
                    ),
                    DataCell (
                      Text(list[index].phonenumber),
                    ),
                    DataCell (
                      Text(list[index].address),
                    ),
                  ]
                ),
              
            ),
    ));   
  }
}