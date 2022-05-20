import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.name,
    required this.email,
    required this.phonenumber,
    required this.address,
  }) : super(key: key);
  final String name, email, phonenumber, address;

  @override
  Widget build(BuildContext context) {
    TableRow tableRow = TableRow(
      children: <Widget> [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(name),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(email),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(phonenumber),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(address),
        )
      ]
    );

    return Center(
      child: Table(
        border: TableBorder.all(),
        children: <TableRow> [
          tableRow,
        ],
      )
    );
  }
}