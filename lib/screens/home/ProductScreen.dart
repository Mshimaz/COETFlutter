import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/services/firebase_services.dart';
import 'package:shopping_app/widgets/CustomButton.dart';
import 'package:shopping_app/widgets/ProductSize.dart';

class ProductScreen extends StatefulWidget {
  final String productId;
  ProductScreen({this.productId});
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("products");
  FirebaseServices _firebaseServices = FirebaseServices();
  String _selectedProductSize = '0';

  Future _addToCart() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Cart")
        .doc(widget.productId)
        .set({'size': _selectedProductSize});
  }

  Future _addToFavourites() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Favourites")
        .doc(widget.productId)
        .set({'size': _selectedProductSize});
  }

  final SnackBar _snackBar = SnackBar(
    content: Text("Product added to the cart"),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _productsRef.doc(widget.productId).get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                // Firebase Document Data Map
                Map<String, dynamic> documentData = snapshot.data.data();

                // List of sizes
                List productSizes = documentData['size'] ?? [""];

                // Set an initial size
                _selectedProductSize = productSizes[0];

                return ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Image.network(
                            "${documentData['image']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () async {
                              await _addToFavourites();
                              Scaffold.of(context).showSnackBar(_snackBar);
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/logo/favouriteinactive.png",
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 10,
                            left: 0,
                            child: FlatButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios),
                                label: Text("")))
                      ],
                    ),
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45)),
                          color: Colors.white),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${documentData['name']}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  "\$${documentData['price']}" ?? "",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 90,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${documentData['desc']}" ?? "",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          ProductSize(
                            productSizes: productSizes,
                            onSelected: (size) {
                              _selectedProductSize = size;
                            },
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          CustomButton(
                            onPressed: () async {
                              await _addToCart();
                              Scaffold.of(context).showSnackBar(_snackBar);
                            },
                            text: "Add to Cart",
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }

              // Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
