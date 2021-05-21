import 'package:flutter/material.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //child: child,
        );
  }
}
