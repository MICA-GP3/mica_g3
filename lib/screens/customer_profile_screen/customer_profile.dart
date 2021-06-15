import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/customer_profile_screen/edit_customer.dart';
import 'package:hasta_rental/screens/main_screen/mainpage.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/widgets/endDrawer.dart';
import 'package:hasta_rental/widgets/text_field.dart';

class CustomerProfile extends StatelessWidget {
  int _index = 3;

  @override
  Widget build(BuildContext context) {
    Future<dynamic> _changeRoute() {
      switch (_index) {
        case 0:
          return Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        default:
          return Navigator.pushNamed(context, '');
      }
    }

    void _onTap(ind) {
      _index = ind;
      _changeRoute();
    }

    return Scaffold(
      appBar: Bar(),
      endDrawer: EndDrawer(),
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
                        Center(
                          child: Text(
                            'Profile',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
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
                        Center(
                          child: _buildButtons(context, cusID, username,
                              fullname, phone, matric, ic, email, password),
                        ),
                      ],
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Row _buildButtons(BuildContext context, index, username, fullname, phone,
      matric, ic, email, password) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            child: Text('EDIT'),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditCustomer(
                    custID: index,
                    fullname: fullname,
                    phone: phone,
                    ic: ic,
                    matric: matric,
                    email: email,
                    password: password,
                  ),
                ))),
        SizedBox(
          width: 0.0,
          height: 20,
        ),
      ],
    );
  }
}
