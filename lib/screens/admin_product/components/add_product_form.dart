import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamestation/models/products_model.dart';
import 'package:gamestation/models/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  
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
          if (value!.isEmpty) {
            return ("Product name cannot be Empty");
          }
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
          if (value!.isEmpty) {
            return ("Description cannot be Empty");
          }
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
          if (value!.isEmpty) {
            return ("Description cannot be Empty");
          }
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
          if (value!.isEmpty) {
            return ("Price cannot be Empty");
          }
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
          if (value!.isEmpty) {
            return ("Amount cannot be Empty");
          }
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
          if (value!.isEmpty) {
            return ("First image cannot be Empty");
          }
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
          if (value!.isEmpty) {
            return ("Second image cannot be Empty");
          }
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
          if (value!.isEmpty) {
            return ("Third image cannot be Empty");
          }
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
          if (value!.isEmpty) {
            return ("Fourth image cannot be Empty");
          }
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

    final addButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: primaryColor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            final check = await Products.checkProductbyid(productCodeEditingController.text);
            if(!check) {
              add();
              productCodeEditingController.clear();
              nameEditingController.clear();
              descriptionEditingController.clear();
              typeEditingController.clear();
              priceEditingController.clear();
              amountEditingController.clear();
              image1EditingController.clear();
              image2EditingController.clear();
              image3EditingController.clear();
              image4EditingController.clear();
            } else {
              Fluttertoast.showToast(msg: "Product has already existed ");
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
                    addButton,
                    SizedBox(height: 5),
                  ],
                ),
              );
  }

  void add() async {
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
    productModel.name = nameEditingController.text;
    productModel.description = descriptionEditingController.text;
    productModel.type = typeEditingController.text;
    productModel.price = double.tryParse(priceEditingController.text);
    productModel.amount = int.tryParse(amountEditingController.text);
    productModel.isHot = false;
    productModel.isNew = true;
    productModel.image = [image1EditingController.text,
                          image2EditingController.text,
                          image3EditingController.text,
                          image4EditingController.text];

    await firebaseFirestore
        .collection("products")
        .doc(productCodeEditingController.text)
        .set(productModel.toMap());
    Fluttertoast.showToast(msg: "Product created successfully :) ");
  }
}