import 'package:flutter/material.dart';
import 'body.dart';
import 'bar.dart';

class mainpage extends StatefulWidget {
  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<mainpage> {
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
