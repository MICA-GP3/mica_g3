import 'package:flutter/material.dart';
import 'package:hasta_rental/models/customer.dart';
import 'body.dart';
import 'bar.dart';

class CustomerProfile extends StatelessWidget {
  static Route route({isEditing = true, data}) => MaterialPageRoute(
      builder: (context) => CustomerProfile(isEditing: isEditing, data: data));

  final bool _isEditing;
  final Customer _data;

  get isEditing => _isEditing;
  get data => _data;

  CustomerProfile({isEditing, data})
      : _isEditing = isEditing,
        _data = data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Bar(),
        body: Body(
          state: this,
        ),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[DrawerHeader(child: Text('Header'))],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3,
          type: BottomNavigationBarType.fixed,
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
      ),
    );
  }
}
