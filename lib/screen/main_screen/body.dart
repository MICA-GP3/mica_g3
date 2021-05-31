import 'package:flutter/material.dart';
import 'package:hasta_rental/screen/customer_profile_screen/customer_profile.dart';

class Body extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  _bodystate createState() => _bodystate();
}

class _bodystate extends State<Body> {
  int _index = 0;
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
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onTap(int ind) {
    setState(() {
      _index = ind;
      _changeRoute();
    });
  }

  Future<dynamic> _changeRoute() {
    switch (_index) {
      case 3:
        return Navigator.push(context, CustomerProfile.route());
      default:
        return null;
    }
  }
}
