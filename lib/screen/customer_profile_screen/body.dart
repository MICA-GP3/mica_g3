import 'package:flutter/material.dart';
import 'package:hasta_rental/models/customer.dart';
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
      _buildTextField(
          title: 'Username',
          value: _state.data.username,
          onchanged: (value) => _state.data.username = value),
      _buildTextField(
          title: 'Full Name',
          value: _state.data.fullname,
          onchanged: (value) => _state.data.fullname = value),
      _buildTextField(
          title: 'IC/Passport',
          value: _state.data.ic,
          onchanged: (value) => _state.data.ic = value),
      _buildTextField(
          title: 'Matric No',
          value: _state.data.matricNo,
          onchanged: (value) => _state.data.matricNo = value),
      _buildTextField(
          title: 'Phone',
          value: _state.data.phone,
          onchanged: (value) => _state.data.phone = value),
      _buildTextField(
          title: 'Email',
          value: _state.data.email,
          onchanged: (value) => _state.data.email = value),
      _buildTextField(title: 'Password', value: '', onchanged: (value) {}),
      _buildTextField(
          title: 'Confrim Password', value: '', onchanged: (value) {}),
      _buildButtons(context),
    ]);
  }

  ListTile _buildTextField({title, value, onchanged}) {
    if (_state != null) {
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
    if (_state != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('EDIT'),
            onPressed: () => _editProfile(context, 1),
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
