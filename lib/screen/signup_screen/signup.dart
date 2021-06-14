import 'package:flutter/material.dart';
import 'body.dart';
import 'bar.dart';

class SignUp extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => SignUp());

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  String _usern = '';
  String _pass = '';
  String _ic = '';
  String _matricNo = '';
  String _phone = '';
  String _email = '';
  String _errorM = '';

  get usern => _usern;
  set usern(value) => setState(() {
        _usern = value;
      });

  get pass => _pass;
  set pass(value) => setState(() {
        _pass = value;
      });

  get ic => _usern;
  set ic(value) => setState(() {
        _usern = value;
      });

  get matricNo => _pass;
  set matricNo(value) => setState(() {
        _pass = value;
      });

  get phone => _pass;
  set phone(value) => setState(() {
        _pass = value;
      });

  get email => _usern;
  set email(value) => setState(() {
        _usern = value;
      });

  get errorM => _errorM;
  set errorM(value) => setState(() {
        _errorM = value;
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Bar(),
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
