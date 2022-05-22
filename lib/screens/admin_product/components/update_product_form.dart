import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamestation/models/products.dart';
import 'package:gamestation/models/products_model.dart';
import 'package:gamestation/models/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';

class UpdateProductForm extends StatefulWidget {
  @override
  _UpdateProductFormState createState() => _UpdateProductFormState();
}

class _UpdateProductFormState extends State<UpdateProductForm> {
  
  String? errorMessage;
  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final productCodeEditingController = new TextEditingController();
  final nameEditingController = new TextEditingController();
  final descriptionEditingController = new TextEditingController();
  final typeEditingController = new TextEditingController();
  final priceEditingController = new TextEditingController();
  final amountEditingController = new TextEditingController();
  final image1EditingController = new TextEditingController();
  final image2EditingController = new TextEditingController();
  final image3EditingController = new TextEditingController();
  final image4EditingController = new TextEditingController();
  final isHotEditingController = new TextEditingController();
  final isNewEditingController = new TextEditingController();

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
    
    final nameField = TextFormField(
        autofocus: false,
        controller: nameEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Product Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

      final descriptionField = TextFormField(
        autofocus: false,
        controller: descriptionEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          descriptionEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.description),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

      final typeField = TextFormField(
        autofocus: false,
        controller: typeEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          typeEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.production_quantity_limits_outlined),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Product Type",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        final priceField = TextFormField(
        autofocus: false,
        controller: priceEditingController,
        keyboardType: TextInputType.number,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          priceEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.money),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Price",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        final amountField = TextFormField(
        autofocus: false,
        controller: amountEditingController,
        keyboardType: TextInputType.number,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          amountEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.numbers_outlined),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Amount",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        final image1Field = TextFormField(
        autofocus: false,
        controller: image1EditingController,
        keyboardType: TextInputType.url,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          image1EditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.image),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Image",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

      final image2Field = TextFormField(
        autofocus: false,
        controller: image2EditingController,
        keyboardType: TextInputType.url,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          image2EditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.image),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Image",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        final image3Field = TextFormField(
        autofocus: false,
        controller: image3EditingController,
        keyboardType: TextInputType.url,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          image3EditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.image),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Third Image",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        final image4Field = TextFormField(
        autofocus: false,
        controller: image4EditingController,
        keyboardType: TextInputType.url,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          image4EditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.image),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Fourth Image",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        final isHotField = TextFormField(
        autofocus: false,
        controller: isHotEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          isHotEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.favorite),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Hot (true or false)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        final isNewField = TextFormField(
        autofocus: false,
        controller: isNewEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          isNewEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.new_label),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "New (true or false)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final addButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: primaryColor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            final check = await Products.checkProductbyid(productCodeEditingController.text);
            if(check) {
              if(nameEditingController.text != ""){
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"name": nameEditingController.text}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                nameEditingController.clear();
                Fluttertoast.showToast(msg: " Update name successfully :) ");
              }
              if(descriptionEditingController.text != ""){
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"description": descriptionEditingController.text}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                descriptionEditingController.clear();
                Fluttertoast.showToast(msg: " Update description successfully :) ");
              }
               if(typeEditingController.text != ""){
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"type": typeEditingController.text}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                typeEditingController.clear();
                Fluttertoast.showToast(msg: " Update type successfully :) ");
              }
               if(priceEditingController.text != ""){
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"price": double.tryParse(priceEditingController.text)}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                priceEditingController.clear();
                Fluttertoast.showToast(msg: " Update price successfully :) ");
              }
               if(amountEditingController.text != ""){
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"amount": int.tryParse(amountEditingController.text)}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                amountEditingController.clear();
                Fluttertoast.showToast(msg: " Update amount successfully :) ");
              }
               List<String> list = await Products.getProductsbyid(productCodeEditingController.text);         
               if(image1EditingController.text != ""){
                list.removeAt(0);
                list.insert(0,image1EditingController.text);
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"image": list}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                image1EditingController.clear();
                Fluttertoast.showToast(msg: " Update first image successfully :) ");
              }
               if(image2EditingController.text != ""){
                list.removeAt(1);
                list.insert(1,image2EditingController.text);
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"image": list}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                image2EditingController.clear();
                Fluttertoast.showToast(msg: " Update second image successfully :) ");
              }
               if(image3EditingController.text != ""){
                list.removeAt(2);
                list.insert(2,image3EditingController.text);
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"image": list}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                image3EditingController.clear();
                Fluttertoast.showToast(msg: " Update third image successfully :) ");
              }
               if(image4EditingController.text != ""){
                list.removeAt(3);
                list.insert(3,image4EditingController.text);
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"image": list}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                image4EditingController.clear();
                Fluttertoast.showToast(msg: " Update fourth image successfully :) ");
              }
              if(isHotEditingController.text.toLowerCase() == "true"){
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"isHot": true}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                isHotEditingController.clear();
                Fluttertoast.showToast(msg: " Update hot successfully :) ");
              }
              if(isHotEditingController.text.toLowerCase() == "false"){
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"isHot": false}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                isHotEditingController.clear();
                Fluttertoast.showToast(msg: " Update hot successfully :) ");
              }
              if(isNewEditingController.text.toLowerCase() == "true"){
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"isNew": true}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                isNewEditingController.clear();
                Fluttertoast.showToast(msg: " Update new successfully :) ");
              }
              if(isNewEditingController.text.toLowerCase() == "false"){
                FirebaseFirestore.instance.collection("products")
                .doc(productCodeEditingController.text)
                .update({"isNew": false}).then(                     
                (value) => print("DocumentSnapshot successfully updated!"),
                onError: (e) => print("Error updating document $e"));
                isNewEditingController.clear();
                Fluttertoast.showToast(msg: " Update new successfully :) ");
              }
              productCodeEditingController.clear();
            } else {
              Fluttertoast.showToast(msg: "Cannot find product to update ");
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
                    nameField,
                    SizedBox(height: 10),
                    descriptionField,
                    SizedBox(height: 10),
                    typeField,
                    SizedBox(height: 10),
                    priceField,
                    SizedBox(height: 10),
                    amountField,
                    SizedBox(height: 10),
                    image1Field,
                    SizedBox(height: 10),
                    image2Field,
                    SizedBox(height: 10),
                    image3Field,
                    SizedBox(height: 10),
                    image4Field,
                    SizedBox(height: 10),
                    isHotField,
                    SizedBox(height: 10),
                    isNewField,
                    SizedBox(height: 10),
                    addButton,
                    SizedBox(height: 5),
                  ],
                ),
              );
  }
}