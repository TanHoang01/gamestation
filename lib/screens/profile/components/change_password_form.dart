import 'package:flutter/material.dart';
import 'package:gamestation/components/keyboard.dart';
import 'package:gamestation/components/default_buttom.dart';

import 'package:gamestation/constants.dart';

class ChangePasswordForm extends StatefulWidget {
  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePasswordForm> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text( 
                "Change Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
              ),
          SizedBox(height: 15),
                SizedBox(height: 20),
                Center(                 
                child: Form(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(10.0),),
                      buildPasswordFormField(),
                      SizedBox(height: 20),
                      buildNewPasswordFormField(),
                      SizedBox(height: 20),
                      buildRePasswordFormField(),
                      SizedBox(height: 20),
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
                                        child: Text('Save'),
                                        onPressed: () => {
                                          KeyboardUtil.hideKeyboard(context)
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                    )
                  ),
                ),
              )
            );
          }
              TextFormField buildPasswordFormField() {
                return TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.lock),
                  ),
                );
              }

              TextFormField buildNewPasswordFormField() {
                return TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "New Password",
                    hintText: "Enter your new password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.lock),
                  ),
                );                                  
              }

               TextFormField buildRePasswordFormField() {
                return TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "New Password",
                    hintText: "Reenter your new password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.lock),
                  ),
                );                                  
              }
}
     
 