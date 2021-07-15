import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/main_screen/mainpage.dart';
import 'package:hasta_rental/screens/manage_booking_screen/manage_booking_vm.dart';
import 'package:hasta_rental/services/booking_service.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';

class ManageBookingPage extends StatefulWidget {
  @override
  _ManageBookingPage createState() => _ManageBookingPage();
}

class _ManageBookingPage extends State<ManageBookingPage> {
  Future<FirebaseApp> _initialize() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Bar(),
        endDrawer: Drawer(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              DrawerHeader(child: Text('Hello Admin !')),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Log Out"),
                  tileColor: Colors.amber,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              //title: Text("Log Out?"),
                              content: Text("Are you sure?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        CustomerServ.username = null;
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MainPage()),
                                                (route) => false);
                                      });
                                    },
                                    child: Text("Yes")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("No")),
                              ],
                            ));
                  },
                ),
              )),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Report',
            ),
          ],
        ),
        body: Container(
            child: FutureBuilder<QuerySnapshot>(
          future: Booking.readBooking(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                padding: EdgeInsets.all(20),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var detailID = snapshot.data!.docs[index].id;
                  var details = snapshot.data!.docs[index].data()! as Map;
                  var colors;
                  if (details['status'] == "Pending") {
                    colors = Colors.yellow[100];
                  } else if (details['status'] == "Success") {
                    colors = Colors.green[100];
                  } else {
                    colors = Colors.red[100];
                  }
                  return Container(
                    padding: EdgeInsets.all(10),
                    color: colors,
                    child: Row(
                      children: [
                        Text(
                            'Booking ID: $detailID \nVechile Type: ${details['carName']}'),
                        Spacer(),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ManageBVM(
                                            bookingDetails: details,
                                            bookingID: detailID,
                                          )));
                            },
                            child: Text('View')),
                      ],
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        )),
      ),
    );
  }
}
