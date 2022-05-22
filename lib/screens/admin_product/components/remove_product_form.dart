import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamestation/models/products_model.dart';
import 'package:gamestation/models/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';

class RemoveProductForm extends StatefulWidget {
  @override
  _RemoveProductFormState createState() => _RemoveProductFormState();
}

class _RemoveProductFormState extends State<RemoveProductForm> {
  
  String? errorMessage;
  // our form key
  final _formKey = GlobalKey<FormState>();
  final productCodeEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productCodeField = TextFormField(
        autofocus: false,
        controller: productCodeEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Product ID cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          productCodeEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.code),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Product ID",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    
    final removeButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: primaryColor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            final check = await Products.checkProductbyid(productCodeEditingController.text);
            if(check) {
              remove();
              productCodeEditingController.clear();
            } else {
              Fluttertoast.showToast(msg: "Cannot find product to remove ");
            }
          },
          child: Text(
            "Save",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10),
                    productCodeField,
                    SizedBox(height: 10),
                    removeButton,
                    SizedBox(height: 5),
                  ],
                ),
              );
  }
  void remove() async {
    if (_formKey.currentState!.validate()) {
      try {
        postDetailsToFirestore();
      } on FirebaseException catch (error){
        
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    ProductModel productModel = ProductModel();

    // writing all the values
    productModel.id = productCodeEditingController.text;

    await firebaseFirestore
        .collection("products")
        .doc(productCodeEditingController.text)
        .delete();
    Fluttertoast.showToast(msg: "Product remove successfully :) ");
  }
}