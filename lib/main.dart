import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/user.dart';
import 'package:shopping_app/screens/wrapper.dart';
import 'package:shopping_app/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}