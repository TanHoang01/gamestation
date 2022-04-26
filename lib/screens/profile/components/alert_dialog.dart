import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/screens/sign_in/sign_in_screen.dart';

enum DialogsAction { yes, cancel}

class AlertDialogs{
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),            
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(DialogsAction.cancel),
                child: Text( "Cancel",
                style: TextStyle(
                  color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SignInScreen(),
              ));
            },
                child: Text( "Confirm",
                style: TextStyle(
                  color: primaryColor, fontWeight: FontWeight.w700),
                ),
              )             
            ],
          );
        }
    );
    return (action != null ? action: DialogsAction.cancel);
  }
}