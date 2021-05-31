import 'package:flutter/material.dart';
import 'package:hasta_rental/screen/customer_profile_screen/customer_profile.dart';
import 'body.dart';
import 'bar.dart';

class MainPage extends StatefulWidget {
  @override
  _Mainpage createState() => _Mainpage();
}

class _Mainpage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Bar(),
        body: Body(),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(child: Text('Header')),
              ListTile(
                title: Text('Profile'),
                onTap: () => Navigator.push(context, CustomerProfile.route()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
