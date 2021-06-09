import 'package:flutter/material.dart';
import 'body.dart';
import 'bar.dart';

class Login extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => Login());

  String _usern = '';
  String _pass = '';
  String get usern => this._usern;

  set usern(String value) => this._usern = value;

  get pass => this._pass;

  set pass(value) => this._pass = value;

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
