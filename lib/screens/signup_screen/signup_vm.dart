import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/customer_profile_screen/customer_profile.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/custom_field.dart';
import 'package:hasta_rental/widgets/validate.dart';

class SignUpVM extends StatefulWidget {
  final FocusNode usernameNode;
  final FocusNode fullnameNode;
  final FocusNode ic;
  final FocusNode matricNoNode;
  final FocusNode phoneNode;
  final FocusNode emailNode;
  final FocusNode passwordNode;

  const SignUpVM(
      {required this.usernameNode,
      required this.fullnameNode,
      required this.ic,
      required this.matricNoNode,
      required this.phoneNode,
      required this.emailNode,
      required this.passwordNode});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpVM> {
  final _addCustomerFormKey = GlobalKey<FormState>();
  bool _isProcessiong = false;

  final TextEditingController _username = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _ic = TextEditingController();
  final TextEditingController _matricNo = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _addCustomerFormKey,
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 26,
                  ),
                  Center(
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.amber,
                  ),
                  Center(
                    child: Image.asset('images/sign_up.png'),
                  ),
                  CustomFormField(
                      controller: _username,
                      focusNode: widget.usernameNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Username',
                      hint: 'Enter Username',
                      enabled: true,
                      validator: (value) =>
                          Validator.validateField(value: value)),
                  CustomFormField(
                      controller: _fullname,
                      focusNode: widget.fullnameNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Full Name',
                      hint: 'Enter Your Full Name',
                      enabled: true,
                      validator: (value) =>
                          Validator.validateField(value: value)),
                  CustomFormField(
                      controller: _ic,
                      focusNode: widget.ic,
                      keyboardType: TextInputType.number,
                      inputAction: TextInputAction.next,
                      label: 'IC',
                      hint: 'Enter Your IC',
                      enabled: true,
                      validator: (value) =>
                          Validator.validateField(value: value)),
                  CustomFormField(
                      controller: _phone,
                      focusNode: widget.phoneNode,
                      keyboardType: TextInputType.number,
                      inputAction: TextInputAction.next,
                      label: 'Phone No',
                      hint: 'Enter Your Phone Number',
                      enabled: true,
                      validator: (value) =>
                          Validator.validateField(value: value)),
                  CustomFormField(
                      controller: _matricNo,
                      focusNode: widget.matricNoNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Matric Number',
                      hint: 'Enter Your Matric Number',
                      enabled: true,
                      validator: (value) =>
                          Validator.validateField(value: value)),
                  CustomFormField(
                      controller: _email,
                      focusNode: widget.emailNode,
                      keyboardType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      label: 'Email',
                      hint: 'Enter Your Email',
                      enabled: true,
                      validator: (value) =>
                          Validator.validateField(value: value)),
                  CustomFormField(
                      controller: _password,
                      focusNode: widget.passwordNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Password',
                      hint: 'Enter Your Password',
                      enabled: true,
                      validator: (value) =>
                          Validator.validateField(value: value)),
                ],
              ),
            ),
            _isProcessiong
                ? Padding(
                    padding: EdgeInsets.zero,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    ),
                  )
                : Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber)),
                      onPressed: () async {
                        widget.usernameNode.unfocus();
                        widget.fullnameNode.unfocus();
                        widget.ic.unfocus();
                        widget.emailNode.unfocus();
                        widget.matricNoNode.unfocus();
                        widget.emailNode.unfocus();
                        widget.passwordNode.unfocus();

                        if (_addCustomerFormKey.currentState!.validate()) {
                          setState(() {
                            _isProcessiong = true;
                          });
                          await CustomerServ.addItem(
                              username: _username.text,
                              fullname: _fullname.text,
                              ic: _ic.text,
                              matricNo: _matricNo.text,
                              phone: _phone.text,
                              email: _email.text,
                              password: _password.text);

                          setState(() {
                            _isProcessiong = false;
                          });
                          CustomerServ.username = _username.text;
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerProfile()),
                              (route) => false);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: Text('Sign Up'),
                      ),
                    ),
                  ),
            SizedBox(
              height: 50,
            )
          ],
        )));
  }
}
