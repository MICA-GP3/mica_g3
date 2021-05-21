import 'package:flutter/material.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(),
    );
  }
}
