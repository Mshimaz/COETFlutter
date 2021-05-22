import 'package:flutter/material.dart';
import 'package:shopping_app/services/auth.dart';
import 'package:shopping_app/widgets/SignInTextBox.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
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
                "SIGN UP",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(
                height: 33,
              ),
              SignInTextBox(
                  displayLogo: "assets/logo/Profile.png",
                  displayHintText: "Name",
                  changeAction: (val) {
                    setState(() => name = val);
                  },
              errorShown: (val) => val.isEmpty ? "Enter the name" : null),
              SignInTextBox(
                displayLogo: "assets/logo/Message.png",
                displayHintText: "Email",
                changeAction: (val) {
                  setState(() => email = val);
                },
                  errorShown: (val) => val.isEmpty ? "Enter the email" : null
              ),
              SignInTextBox(
                displayLogo: "assets/logo/Lock.png",
                displayHintText: "Password",
                changeAction: (val) {
                  setState(() => password = val);
                },
                isPassword: true,
                  errorShown: (val) => val.length<6 ? "Password should be more than 6 characters" : null
              ),
              SizedBox(
                height: 30,
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
                    "SIGN UP",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()){
                      dynamic result = await _auth.signUpWithEmailAndPassword(email, password);
                      if (result == null){
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
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey[700],fontSize: 16),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                      child: Text("Sign In",
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
      ),
    );
  }
}
