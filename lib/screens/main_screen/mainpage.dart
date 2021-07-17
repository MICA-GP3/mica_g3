import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/booking_history_screen/booking_history.dart';
import 'package:hasta_rental/screens/car_list_screen/car_list.dart';
import 'package:hasta_rental/screens/customer_profile_screen/customer_profile.dart';
import 'package:hasta_rental/screens/main_screen/log_or_sign.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/widgets/endDrawer.dart';
import 'body.dart';

class MainPage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => MainPage());
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _index = 0;

  Future<FirebaseApp> _initialize() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Bar(),
        body: SafeArea(
          child: FutureBuilder(
            future: _initialize(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error Initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Body();
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            },
          ),
        ),
        endDrawer: EndDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
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
}
