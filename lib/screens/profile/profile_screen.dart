import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamestation/screens/home/home_screen.dart';
import 'package:gamestation/screens/profile/change_password_screen.dart';
import 'package:gamestation/screens/sign_in/sign_in_screen.dart';

import 'components/alert_dialog.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  bool tappedYes = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 25 ),
      child: ListView(
        children: [
          Text( 
            "Profile Information",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
          ),
          SizedBox(height: 15),
          Center(
          child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor
                    ),
                    boxShadow: [ BoxShadow(
                       spreadRadius: 2, blurRadius: 10,
                       color: Colors.black.withOpacity(0.1),
                       offset: Offset(0,10)
                      )
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: ExactAssetImage('assets/images/ps4.png')
                    )                   
                  ),
                )
              ],
            )
          ),
          buildTextField("Full Name","Tan Hoang"),
          buildTextField("Email","Tan@gmail.com"),
          buildTextField("Phone","0123456789"),
          buildTextField("Address","Ho Chi Minh"),
          buildTextField("Purchased items","1"),
          buildTextField("Sold items","1"),
          SizedBox(height: 20),
          Column(
            children: [
              Container(
                width: 150,
                height: 40,
                child: DecoratedBox(
                  decoration:
                      ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))), color: primaryColor),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        buttonTheme: ButtonTheme.of(context).copyWith(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text('Change Password'),
                      onPressed: () => {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChangePassword(),
                        ))
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 150,
                height: 40,
                child: DecoratedBox(
                  decoration:
                      ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))), color: primaryColor),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        buttonTheme: ButtonTheme.of(context).copyWith(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text('Log out'),
                      onPressed: () async {
                        final action = await AlertDialogs.yesCancelDialog(context, 'Logout', 'Are you sure to quit?');
                        if(action == DialogsAction.yes) {
                          setState(() => tappedYes = true);
                        }
                      }
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: FlatButton(
                child: Text('About us'),
                onPressed: () {},
              ),
            ),
            ],
          )
        ],
      ),
    );
  }

  TextField buildTextField(String labletext, String placeholder) {
    return TextField(
          focusNode: new AlwaysDisabledFocusNode(),
          decoration: InputDecoration(
            labelText: labletext,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold,
              color: Colors.black 
            )
          ),
        );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}