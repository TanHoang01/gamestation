import 'package:flutter/material.dart';
import 'package:gamestation/components/keyboard.dart';
import 'package:gamestation/components/default_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamestation/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We will send to your email a link for new password",
                textAlign: TextAlign.center,
              ),
              ChangePasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final TextEditingController emailController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
             DefaultButton(
            text: "Send to my email",
            press: ()  {             
                auth.sendPasswordResetEmail(email: auth.currentUser!.email.toString());
                Fluttertoast.showToast(msg: "Plase check your email for new password");
                 Navigator.of(context).pop();           
            },
          ),
        ],
      ),
    );
  }
}
     
 