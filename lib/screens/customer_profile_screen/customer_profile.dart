import 'package:flutter/material.dart';
import 'package:hasta_rental/models/customer.dart';

import 'customer_profile_vm.dart';

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
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'My Profile',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.black38,
          ),
          _buildTextField(title: 'Username', value: '', onchanged: (value) {}),
          _buildButtons(context),
        ]),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[DrawerHeader(child: Text('Header'))],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
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

  ListTile _buildTextField({title, value, onchanged}) {
    if (null) {
      return ListTile(
        title: TextFormField(
          initialValue: value,
          decoration: InputDecoration(
              labelText: title,
              hintText: title,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.amber))),
          onChanged: onchanged,
          enabled: false,
        ),
      );
    } else {
      return ListTile(
        title: TextFormField(
          initialValue: value,
          decoration: InputDecoration(
              labelText: title,
              hintText: title,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.amber))),
          onChanged: onchanged,
          enabled: true,
        ),
      );
    }
  }

  Row _buildButtons(BuildContext context) {
    if (null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('EDIT'),
            onPressed: () => _editProfile(context, null),
          ),
          SizedBox(width: 50.0),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('Ok'),
            onPressed: () {},
          ),
          SizedBox(width: 10.0),
          ElevatedButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    }
  }

  void _editProfile(BuildContext context, int index) async {
    final _editProf = CustomerProfile(isEditing: true, data: Customer());
    var _update = await Navigator.push(
        context,
        CustomerProfile.route(
          isEditing: true,
          data: _editProf.data,
        ));
    if (_update != null) {}
  }
}
