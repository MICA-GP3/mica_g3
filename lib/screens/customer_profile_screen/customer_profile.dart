import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/booking_history_screen/booking_history.dart';
import 'package:hasta_rental/screens/car_list_screen/car_list.dart';
import 'package:hasta_rental/screens/customer_profile_screen/edit_customer.dart';
import 'package:hasta_rental/screens/main_screen/mainpage.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/widgets/endDrawer.dart';
import 'package:hasta_rental/widgets/text_field.dart';

class CustomerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _index = 3;
    Future<dynamic> _changeRoute() {
      switch (_index) {
        case 0:
          return Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        case 1:
          return Navigator.push(context, CarListPage.route());
        case 2:
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => BookingHistoryPage()));
        case 3:
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => CustomerProfile()));

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
              return Container(
                color: Colors.amber[200],
                child: ListView.separated(
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

                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            Center(
                              child: Text(
                                'PROFILE',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                  title: TextFField(
                                value: username,
                                enable: false,
                                label: 'Username',
                              )),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                  title: TextFField(
                                value: fullname,
                                enable: false,
                                label: 'Fullname',
                              )),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                  title: TextFField(
                                value: email,
                                enable: false,
                                label: 'Email',
                              )),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                  title: TextFField(
                                value: phone,
                                enable: false,
                                label: 'Phone Number',
                              )),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                  title: TextFField(
                                value: matric,
                                enable: false,
                                label: 'Matric',
                              )),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                  title: TextFField(
                                value: ic,
                                enable: false,
                                label: 'IC',
                              )),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                  title: TextFField(
                                value: password,
                                enable: false,
                                label: 'Password',
                              )),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Center(
                              child: _buildButtons(context, cusID, username,
                                  fullname, phone, matric, ic, email, password),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      );
                    }),
              );
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
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'History',
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
            child: Text(
              'EDIT DETAILS',
              style: TextStyle(color: Colors.white),
            ),
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
