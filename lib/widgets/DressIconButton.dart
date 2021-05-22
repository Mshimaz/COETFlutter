import 'package:flutter/material.dart';

class DressIconButton extends StatelessWidget {
  final String dressImage;
  final String dressText;
  DressIconButton({@required this.dressImage,@required this.dressText});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71,
      height: 75,
      margin: EdgeInsets.only(left: 15,right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey,width: 1)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset((dressImage)),
          Text(dressText)
        ],
      ),
    );
  }
}
