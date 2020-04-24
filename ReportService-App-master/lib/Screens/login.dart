import 'package:flutter/material.dart';
import '../main.dart';
import './home.dart';
import '../Models/User.dart';

class LoginScreen extends StatelessWidget {
  final ReportServiceState parent;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen(this.parent);

  void authenticate(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;
    try {
      User user = await User.login(username, password);
      parent.changeHomeScreen(Home(user));
    } catch (e) {
      String errMessage =
          e.message is Map ? e.message['msg'] : "Could not contact the server";
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          errMessage,
          style: TextStyle(color: Colors.red),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                labelText: "Password",
                prefixIcon: Icon(Icons.vpn_key),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            RaisedButton(
              padding: EdgeInsets.all(10),
              color: Colors.lightGreen,
              textColor: Colors.white,
              shape: StadiumBorder(),
              onPressed: () {
                authenticate(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.art_track),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}
