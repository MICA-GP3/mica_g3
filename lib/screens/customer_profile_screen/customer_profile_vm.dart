import 'package:flutter/material.dart';
import 'package:hasta_rental/widgets/custom_field.dart';
import 'package:hasta_rental/widgets/validate.dart';

class CustomerProfileVM extends StatefulWidget {
  final FocusNode usernameNode;
  final FocusNode fullnameNode;
  final FocusNode icNode;
  final FocusNode matricNoNode;
  final FocusNode phoneNode;
  final FocusNode emailNode;
  final FocusNode passwordNode;

  final String username;
  final String fullname;
  final String ic;
  final String matric;
  final String phone;
  final String email;
  final String password;
  final String custID;

  const CustomerProfileVM({
    required this.usernameNode,
    required this.fullnameNode,
    required this.icNode,
    required this.matricNoNode,
    required this.phoneNode,
    required this.emailNode,
    required this.passwordNode,
    required this.username,
    required this.fullname,
    required this.ic,
    required this.matric,
    required this.phone,
    required this.email,
    required this.password,
    required this.custID,
  });

  @override
  CustState createState() => CustState();
}

class CustState extends State<CustomerProfileVM> {
  final _editFormkey = GlobalKey<FormState>();
  bool _isProcessing = false;

  late TextEditingController _usernameController;
  late TextEditingController _fullnameController;
  late TextEditingController _icController;
  late TextEditingController _matricController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController(text: widget.username);
    _fullnameController = TextEditingController(text: widget.fullname);
    _icController = TextEditingController(text: widget.ic);
    _matricController = TextEditingController(text: widget.matric);
    _phoneController = TextEditingController(text: widget.phone);
    _emailController = TextEditingController(text: widget.email);
    _passwordController = TextEditingController(text: widget.password);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _editFormkey,
        child: Form(
          child: Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      CustomFormField(
                          controller: _usernameController,
                          focusNode: widget.fullnameNode,
                          keyboardType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          label: 'Username',
                          hint: 'Username',
                          validator: (value) =>
                              Validator.validateField(value: value))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
