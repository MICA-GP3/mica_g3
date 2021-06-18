import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/car_list_screen/car_list_vm.dart';
import 'package:hasta_rental/services/car_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/widgets/endDrawer.dart';

class CarListPage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => CarListPage());
  @override
  _CarListPage createState() => _CarListPage();
}

class _CarListPage extends State<CarListPage> {
  int _index = 0;

  Future<FirebaseApp> _initialize() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Bar(),
        endDrawer: EndDrawer(),
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
        body: FutureBuilder(
          future: _initialize(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error Connecting');
            } else if (snapshot.hasData) {
              return CarVM();
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          },
        ),
      ),
    );
  }
}
