import 'package:flutter/material.dart';
import 'body.dart';
import 'bar.dart';

class MainPage extends StatefulWidget {
  @override
  _mainpage createState() => _mainpage();
}

class _mainpage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Bar(),
        body: Body(),
      ),
    );
  }
}
