import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/user.dart';
import 'file:///C:/Users/shima/AndroidStudioProjects/shopping_app/lib/screens/home/home.dart';
import 'package:shopping_app/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
