import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/customer_profile_screen/edit_customer.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/widgets/text_field.dart';

class CustomerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: StreamBuilder<QuerySnapshot>(
          stream: CustomerServ.readItems(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something wrong with Firebase');
            } else if (snapshot.hasData || snapshot.data != null) {
              return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                  itemBuilder: (context, index) {
                    var customerInfo = snapshot.data!.docs[index].data()!
                        as Map<String, dynamic>;
                    String cusID = snapshot.data!.docs[index].id;
                    String username = customerInfo['username'];
                    String fullname = customerInfo['fullname'];
                    String email = customerInfo['email'];
                    String phone = customerInfo['phone'];
                    String matric = customerInfo['matricNo'];
                    String ic = customerInfo['ic'];
                    String password = customerInfo['password'];

                    return Column(
                      children: [
                        ListTile(
                            title: TextFField(
                          value: username,
                          enable: false,
                          label: 'Username',
                        )),
                        ListTile(
                            title: TextFField(
                          value: fullname,
                          enable: false,
                          label: 'Fullname',
                        )),
                        ListTile(
                            title: TextFField(
                          value: email,
                          enable: false,
                          label: 'Email',
                        )),
                        ListTile(
                            title: TextFField(
                          value: phone,
                          enable: false,
                          label: 'Phone Number',
                        )),
                        ListTile(
                            title: TextFField(
                          value: matric,
                          enable: false,
                          label: 'Matric No',
                        )),
                        ListTile(
                            title: TextFField(
                          value: ic,
                          enable: false,
                          label: 'IC',
                        )),
                        ListTile(
                            title: TextFField(
                          value: password,
                          enable: false,
                          label: 'Password',
                        )),
                      ],
                    );
                  });
            }
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            );
          }),
    );
  }
}
