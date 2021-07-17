import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/car_list_screen/car_list.dart';
import 'package:hasta_rental/screens/customer_profile_screen/customer_profile.dart';
import 'package:hasta_rental/screens/main_screen/mainpage.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/screens/booking_history_screen/booking_history_vm.dart';
import 'package:hasta_rental/services/booking_service.dart';
import 'package:hasta_rental/widgets/endDrawer.dart';

class BookingHistoryPage extends StatefulWidget {
  @override
  _BookingHistoryPage createState() => _BookingHistoryPage();
}

class _BookingHistoryPage extends State<BookingHistoryPage> {
  int _index = 2;

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

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Bar(),
        endDrawer: EndDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: _onTap,
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
          future: Booking.readOne(),
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
