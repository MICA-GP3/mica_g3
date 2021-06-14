import 'package:flutter/material.dart';
import 'body.dart';

class Login extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => Login());

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  String _usern = '';
  String _pass = '';
  String _errorM = '';

  get usern => _usern;
  set usern(value) => setState(() {
        _usern = value;
      });

  get pass => _pass;
  set pass(value) => setState(() {
        _pass = value;
      });

  get errorM => _errorM;
  set errorM(value) => setState(() {
        _errorM = value;
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Body(
          state: this,
        ),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[DrawerHeader(child: Text('Header'))],
          ),
        ),
      ),
    );
  }
}
