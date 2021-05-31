import 'package:flutter/material.dart';
import 'package:hasta_rental/screen/customer_profile_screen/customer_profile.dart';

class Body extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  const Body({state}) : _state = state;
  final CustomerProfile _state;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
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
      _buildTextField(title: 'Full Name', value: '', onchanged: (value) {}),
      _buildTextField(title: 'IC/Passport', value: '', onchanged: (value) {}),
      _buildTextField(title: 'Matric No', value: '', onchanged: (value) {}),
      _buildTextField(title: 'Phone', value: '', onchanged: (value) {}),
      _buildTextField(title: 'Email', value: '', onchanged: (value) {}),
      _buildTextField(title: 'Password', value: '', onchanged: (value) {}),
      _buildTextField(
          title: 'Confrim Password', value: '', onchanged: (value) {}),
      _buildButtons(context),
    ]);
  }

  ListTile _buildTextField({title, value, onchanged}) {
    return ListTile(
      title: TextFormField(
        initialValue: value,
        decoration: InputDecoration(labelText: title, hintText: title),
        onChanged: onchanged,
      ),
    );
  }

  Row _buildButtons(BuildContext context) {
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
