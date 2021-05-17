import 'package:flutter/material.dart';
import 'package:shopping_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            child: Center(
              child: MaterialButton(onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result==null) {
                  print('error signing in');
                }else {
                  print('signed in');
                  print(result.uid);
                }
               },
              child: Text("Sign In Anon"),
              color: Color(0xff6495ED),),
            ),
          )
        ],
      ),
    );
  }
}
