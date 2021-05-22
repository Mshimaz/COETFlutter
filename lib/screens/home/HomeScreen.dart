import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/DressIconButton.dart';
import 'package:shopping_app/widgets/SearchBox.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(children: [
      Container(
        margin: EdgeInsets.only(
          top: 35,
          left: 20,
        ),
        child: Text(
          "Explore",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20, left: 20),
        child: Text(
          "best Outfits for you",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
          ),
        ),
      ),
      SearchBox(),
      Container(
          height: 80,
          margin: EdgeInsets.only(top: 30),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DressIconButton(
                dressImage: "assets/logo/dress.png",
                dressText: "Dress",
              ),
              DressIconButton(
                dressImage: "assets/logo/shirt.png",
                dressText: "Shirts",
              ),
              DressIconButton(
                dressImage: "assets/logo/pants.png",
                dressText: "Pants",
              ),
              DressIconButton(
                dressImage: "assets/logo/tshirt.png",
                dressText: "T-shirts",
              ),
              DressIconButton(
                dressImage: "assets/logo/sneakers 1.png",
                dressText: "Shoes",
              )
            ],
          )),
      Container(
        margin: EdgeInsets.only(left: 25, top: 50, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Arrival",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),
            ),
            Text("See All",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.grey),)
          ],
        ),
      )
    ]));
  }
}
