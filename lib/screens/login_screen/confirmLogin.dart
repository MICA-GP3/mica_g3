import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/customer_profile_screen/customer_profile.dart';
import 'package:hasta_rental/screens/manage_booking_screen/manage_booking.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/widgets/custom_field.dart';
import 'package:hasta_rental/widgets/text_field.dart';
import 'package:hasta_rental/widgets/validate.dart';

class ConfirmLogin extends StatefulWidget {
  final FocusNode focusNode = FocusNode();

  @override
  _ConfirmLoginState createState() => _ConfirmLoginState();
}

class _ConfirmLoginState extends State<ConfirmLogin> {
  final TextEditingController _uidController = TextEditingController();

  final _loginInFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar(),
        body: Form(
          key: _loginInFormKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: StreamBuilder<QuerySnapshot>(
              stream: CustomerServ.readItems(),
              builder: (context, snapshot) {
                var chs = snapshot.data?.docs;

                if (chs != null) {
                  var details = snapshot.data!.docs[0].data()! as Map;
                  var username = CustomerServ.username;
                  return ListView(
                    children: [
                      SizedBox(
                        height: 34,
                      ),
                      Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black38,
                      ),
                      Center(
                        child: Container(
                          child: Image.asset('images/login_logo.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFField(
                            value: username.toString(),
                            enable: false,
                            label: 'Username'),
                      ),
                      CustomFormField(
                        isObscure: true,
                        controller: _uidController,
                        focusNode: widget.focusNode,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.done,
                        validator: (value) =>
                            Validator.validateField(value: value),
                        enabled: true,
                        hint: 'Password',
                        label: 'Enter Password',
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0.0, right: 0.0),
                        child: Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {
                              widget.focusNode.unfocus();
                              if (_loginInFormKey.currentState!.validate()) {
                                if (_uidController.text ==
                                    details['password']) {
                                  if (details['admin'] == true) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ManageBookingPage()));
                                  } else {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomerProfile()),
                                        (route) => false);
                                  }
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text('Password Error'),
                                          ));
                                }
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.zero,
                              child: Text('Login'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ));
  }
}
