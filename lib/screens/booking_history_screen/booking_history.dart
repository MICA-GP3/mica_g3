import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/screens/booking_history_screen/booking_history_vm.dart';
import 'package:hasta_rental/services/booking_service.dart';
import 'package:hasta_rental/screens/report_screen/report.dart';

class BookingHistoryPage extends StatefulWidget {
  @override
  _BookingHistoryPage createState() => _BookingHistoryPage();
}

class _BookingHistoryPage extends State<BookingHistoryPage> {
  int _index = 0;

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
              DrawerHeader(child: Text('Header')),
              ListTile(
                title: Text('Profile'),
                onTap: () => {},
              ),
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
                                    onPressed: () {}, child: Text("Yes")),
                                TextButton(onPressed: () {}, child: Text("No")),
                              ],
                            ));
                  },
                ),
              )),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
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
                                      builder: (context) => ViewBookingHistory(
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
