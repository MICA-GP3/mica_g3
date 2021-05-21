import 'dart:io';

import 'package:flutter/material.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  _barstate createState() => _barstate();
}

class _barstate extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
          //title: Text("Hasta Car Rental"),
          title: Image.asset(
            'images/HCR.png',
            scale: 10,
          ),
          centerTitle: true,
          backgroundColor: Colors.white),
    );
  }
}
