import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hasta_rental/models/customer.dart';

import 'bar.dart';
import 'body.dart';

class EditProfile extends StatefulWidget {
  static Route route({isEditing = true, data}) => MaterialPageRoute(
      builder: (context) => EditProfile(isEditing: isEditing, data: data));

  final bool _isEditing;
  final Customer _data;

  get isEditing => _isEditing;
  get data => _data;

  EditProfile({isEditing, data})
      : _isEditing = isEditing,
        _data = data;

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: SafeArea(
          child: Scaffold(
            appBar: Bar(state: this),
            body: Body(
              state: this,
            ),
          ),
        ));
  }
}
