import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/login_screen/login.dart';
import 'package:hasta_rental/screens/signup_screen/signup.dart';

class LogOrSign extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => LogOrSign());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 35,
            ),
            Row(
              children: [
                Text(
                  'Login to Your Account',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 0),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            _buildButtons(context, text: 'Login', value: 1),
            Row(
                children: [
                  Text(
                    "Don't have an account? \nSign up for free now!",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center),
            _buildButtons(context, text: 'Sign Up', value: 2),
          ],
        ),
      ),
    );
  }

  Row _buildButtons(BuildContext context, {text, value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
            child: Text(text),
            onPressed: () {
              if (value == 1) {
                Navigator.push(context, Login.route());
              } else {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              }
            }),
        SizedBox(width: 0.0),
      ],
    );
  }
}
