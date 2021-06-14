import 'package:flutter/material.dart';
import 'package:hasta_rental/screen/customer_profile_screen/customer_profile.dart';
import 'package:hasta_rental/screen/main_screen/log_or_sign.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'body.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _index = 0;

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Bar(),
        body: Body(),
        endDrawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(child: Text('Header')),
              ListTile(
                title: Text('Profile'),
                onTap: () => Navigator.push(context, CustomerProfile.route()),
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
      case 3:
        if (_index == 3) {
          return Navigator.push(context, LogOrSign.route());
        } else {
          return Navigator.push(context, CustomerProfile.route());
        }
        break;
      default:
        return null;
    }
  }
}
