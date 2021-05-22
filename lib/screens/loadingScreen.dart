import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(height: 120,
            width: 104,
            child: Image.asset("assets/logo/Vector (1).png",fit: BoxFit.cover,),),
          ),
          SizedBox(height: 20,),
          SpinKitDoubleBounce(color: Color(0xff6495ED),),
        ],
      ),
    );
  }
}
