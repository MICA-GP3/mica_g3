import 'package:flutter/material.dart';
import 'package:hasta_rental/screen/customer_profile_screen/customer_profile.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  const Bar({state}) : _state = state;
  final CustomerProfile _state;

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
