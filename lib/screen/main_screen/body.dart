import 'package:flutter/material.dart';

class Body extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  _bodystate createState() => _bodystate();
}

class _bodystate extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //child: child,
        );
  }
}
