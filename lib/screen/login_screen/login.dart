import 'package:flutter/material.dart';
import 'body.dart';
import 'bar.dart';

class Login extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => Login());

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
