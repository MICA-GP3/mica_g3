import 'package:flutter/material.dart';
import 'package:hasta_rental/models/customer.dart';
import 'package:hasta_rental/services/customer_service.dart';

import 'login.dart';

class Body extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  const Body({state}) : _state = state;
  final Login _state;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            'Log In',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Divider(
        thickness: 1,
        color: Colors.black38,
      ),
      _buildTextField(
          title: 'Username',
          value: '',
          onchanged: (value) => _state.usern = value),
      _buildTextField(
          title: 'Password',
          value: '',
          onchanged: (value) => _state.pass = value),
      _buildButtons(context),
    ]);
  }

  ListTile _buildTextField({title, value, onchanged}) {
    return ListTile(
      title: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
            labelText: title,
            hintText: title,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.amber))),
        onChanged: onchanged,
      ),
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Login'),
          onPressed: () => _onLog(context),
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

  void _onLog(context) async {
    if (_state.usern == '' || _state.pass == '') {
    } else {
      final _user = await CustomerService.getUserByLoginAndPassword(
          login: _state.usern, password: _state.pass);
      if (_user != null) {
        var _showU = Customer.copy(_user);
        Navigator.pop(
            context,
            Customer(
                id: _showU.id, username: _showU.username, email: _showU.email));
      }
    }
  }
}
