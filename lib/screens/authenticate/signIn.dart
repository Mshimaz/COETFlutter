import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/loadingScreen.dart';
import 'package:shopping_app/services/auth.dart';
import 'package:shopping_app/widgets/SignInTextBox.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? LoadingScreen() : Scaffold(
        backgroundColor: Color(0xffFBFBFD),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 99,
                ),
                Container(
                  height: 60,
                  child: Center(
                    child: Image.asset("assets/logo/Vector (1).png"),
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                Text(
                  "SIGN IN",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 33,
                ),
                SignInTextBox(
                  displayLogo: "assets/logo/Message.png",
                  displayHintText: "Email",
                  changeAction: (val){
                    setState(()=> email = val);
                  },
                    errorShown: (val) => val.isEmpty ? "Enter the email" : null
                ),
                SignInTextBox(
                  displayLogo: "assets/logo/Lock.png",
                  displayHintText: "Password",
                  changeAction: (val){
                    setState(()=> password = val);
                  },
                  isPassword: true,
                    errorShown: (val) => val.length<6 ? "Password should be more than 6 characters" : null
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: 59,
                  width: 205,
                  decoration: BoxDecoration(
                    color: Color(0xff6495ED),
                    borderRadius: BorderRadius.circular(133),
                  ),
                  child: MaterialButton(
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()){
                        setState(()=> loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if (result == null){
                          setState(()=> loading = false);
                          setState(() => error = 'Please enter valid email');
                        }
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(error, style: TextStyle(color: Colors.red,fontSize: 14),),
                SizedBox(height: 10,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey[700],fontSize: 16),
                      ),
                      SizedBox(width: 5,),
                      InkWell(
                        child: Text("Sign Up",
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        onTap: (){
                          widget.toggleView();
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
