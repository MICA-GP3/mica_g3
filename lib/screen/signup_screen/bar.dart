import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: Image.asset(
          'images/HCR.png',
          scale: 10,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}
