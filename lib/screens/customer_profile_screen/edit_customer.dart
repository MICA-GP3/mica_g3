import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/customer_profile_screen/customer_profile_vm.dart';
import 'package:hasta_rental/widgets/appbar.dart';

class EditCustomer extends StatefulWidget {
  final String fullname;
  final String ic;
  final String matric;
  final String phone;
  final String email;
  final String password;
  final String custID;

  EditCustomer({
    required this.fullname,
    required this.ic,
    required this.matric,
    required this.phone,
    required this.email,
    required this.password,
    required this.custID,
  });

  @override
  EditState createState() => EditState();
}

class EditState extends State<EditCustomer> {
  final FocusNode fullnameNode = FocusNode();
  final FocusNode icNode = FocusNode();
  final FocusNode matricNoNode = FocusNode();
  final FocusNode phoneNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        fullnameNode.unfocus();
        icNode.unfocus();
        matricNoNode.unfocus();
        phoneNode.unfocus();
        emailNode.unfocus();
        passwordNode.unfocus();
      },
      child: Scaffold(
        appBar: Bar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: CustomerProfileVM(
              custID: widget.custID,
              fullname: widget.fullname,
              fullnameNode: fullnameNode,
              ic: widget.ic,
              icNode: icNode,
              matric: widget.matric,
              matricNoNode: matricNoNode,
              phone: widget.phone,
              phoneNode: phoneNode,
              email: widget.email,
              emailNode: emailNode,
              password: widget.password,
              passwordNode: passwordNode,
            ),
          ),
        ),
      ),
    );
  }
}
