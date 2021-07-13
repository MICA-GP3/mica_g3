import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/customer_profile_screen/customer_profile.dart';
import 'package:hasta_rental/screens/manage_booking_screen/manage_booking.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/custom_field.dart';
import 'package:hasta_rental/widgets/validate.dart';

class Body extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  final FocusNode focusNode;
  const Body({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  final TextEditingController _uidController = TextEditingController();

  final _loginInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginInFormKey,
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          CustomFormField(
            controller: _uidController,
            focusNode: widget.focusNode,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.done,
            validator: (value) => Validator.validateUserID(uid: value),
            enabled: true,
            hint: 'Username',
            label: 'Enter Username',
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.0, right: 0.0),
            child: Container(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  widget.focusNode.unfocus();
                  if (_loginInFormKey.currentState!.validate()) {
                    CustomerServ.username = _uidController.text;

                    if (CustomerServ.admin == true) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManageBookingPage()));
                    } else {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerProfile()),
                          (route) => false);
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
      ),
    );
  }
}
