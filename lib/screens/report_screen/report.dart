import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/main_screen/mainpage.dart';
import 'package:hasta_rental/screens/manage_booking_screen/manage_booking.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/screens/report_screen/report_vm.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPage createState() => _ReportPage();
}

class _ReportPage extends State<ReportPage> {
  Future<FirebaseApp> _initialize() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  int _index = 1;

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
              label: 'Report',
            ),
          ],
        ),
        body: FutureBuilder(
          future: _initialize(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TableReportPage();
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  void _onTap(int ind) {
    setState(() {
      _index = ind;
      _changeRoute();
    });
  }

  Future<dynamic> _changeRoute() {
    switch (_index) {
      case 0:
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => ManageBookingPage()));

      default:
        return Navigator.pushNamed(context, '');
    }
  }
}
