import 'package:flutter/material.dart';
import 'package:shopping_app/services/auth.dart';

class DrawerScreen extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: ClipRRect(
                      child: Image.asset("assets/logo/unknownprofile.png",height: 70,width: 70,),
                    ),
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text("LOG OUT"),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
