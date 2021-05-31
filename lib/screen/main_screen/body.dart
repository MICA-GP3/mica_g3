import 'package:flutter/material.dart';

class Body extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //child: child,
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          //set boxes
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text("data"),
            color: Colors.amber,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text("data1"),
            color: Colors.amber,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text("data2"),
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
