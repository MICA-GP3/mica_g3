import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/customer_profile_screen/customer_profile.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/custom_colors.dart';
import 'package:hasta_rental/widgets/custom_field.dart';
import 'package:hasta_rental/widgets/validate.dart';

class CustomerProfileVM extends StatefulWidget {
  final FocusNode fullnameNode;
  final FocusNode icNode;
  final FocusNode matricNoNode;
  final FocusNode phoneNode;
  final FocusNode emailNode;
  final FocusNode passwordNode;

  final String fullname;
  final String ic;
  final String matric;
  final String phone;
  final String email;
  final String password;
  final String custID;

  const CustomerProfileVM({
    required this.fullnameNode,
    required this.icNode,
    required this.matricNoNode,
    required this.phoneNode,
    required this.emailNode,
    required this.passwordNode,
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

  late TextEditingController _fullnameController;
  late TextEditingController _icController;
  late TextEditingController _matricController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
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
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 24),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        CustomFormField(
                            controller: _fullnameController,
                            focusNode: widget.fullnameNode,
                            keyboardType: TextInputType.text,
                            inputAction: TextInputAction.next,
                            label: 'Full Name',
                            hint: 'Full Name',
                            enabled: true,
                            validator: (value) =>
                                Validator.validateField(value: value)),
                        SizedBox(
                          height: 24,
                        ),
                        CustomFormField(
                            controller: _icController,
                            focusNode: widget.icNode,
                            keyboardType: TextInputType.text,
                            inputAction: TextInputAction.next,
                            label: 'IC',
                            hint: 'IC',
                            enabled: true,
                            validator: (value) =>
                                Validator.validateField(value: value)),
                        SizedBox(
                          height: 24,
                        ),
                        CustomFormField(
                            controller: _matricController,
                            focusNode: widget.matricNoNode,
                            keyboardType: TextInputType.text,
                            inputAction: TextInputAction.next,
                            label: 'Matric No',
                            hint: 'Matric No',
                            enabled: true,
                            validator: (value) =>
                                Validator.validateField(value: value)),
                        SizedBox(
                          height: 24,
                        ),
                        CustomFormField(
                            controller: _phoneController,
                            focusNode: widget.phoneNode,
                            keyboardType: TextInputType.text,
                            inputAction: TextInputAction.next,
                            label: 'Phone Number',
                            hint: 'Phone Number',
                            enabled: true,
                            validator: (value) =>
                                Validator.validateField(value: value)),
                        SizedBox(
                          height: 24,
                        ),
                        CustomFormField(
                            controller: _emailController,
                            focusNode: widget.emailNode,
                            keyboardType: TextInputType.text,
                            inputAction: TextInputAction.next,
                            label: 'EMAIL',
                            hint: 'EMAIL',
                            enabled: true,
                            validator: (value) =>
                                Validator.validateField(value: value)),
                        SizedBox(
                          height: 24,
                        ),
                        CustomFormField(
                            controller: _passwordController,
                            focusNode: widget.passwordNode,
                            keyboardType: TextInputType.text,
                            inputAction: TextInputAction.next,
                            label: 'Password',
                            hint: 'Password',
                            enabled: true,
                            validator: (value) =>
                                Validator.validateField(value: value)),
                      ],
                    ),
                  ),
                ),
                _isProcessing
                    ? Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      )
                    : Container(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  CustomColors.firebaseOrange)),
                          onPressed: () async {
                            widget.fullnameNode.unfocus();
                            widget.icNode.unfocus();
                            widget.matricNoNode.unfocus();
                            widget.phoneNode.unfocus();
                            widget.emailNode.unfocus();
                            widget.passwordNode.unfocus();

                            if (_editFormkey.currentState!.validate()) {
                              setState(() {
                                _isProcessing = true;
                              });

                              await CustomerServ.updateItem(
                                  fullname: _fullnameController.text,
                                  ic: _icController.text,
                                  matricNo: _matricController.text,
                                  phone: _phoneController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  docId: widget.custID);

                              setState(() {
                                _isProcessing = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomerProfile()));
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Text('Update Profile'),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ));
  }
}
