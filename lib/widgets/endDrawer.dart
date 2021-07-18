import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/car_list_screen/car_list.dart';
import 'package:hasta_rental/screens/main_screen/mainpage.dart';
import 'package:hasta_rental/services/customer_service.dart';

class EndDrawer extends StatefulWidget {
  @override
  EndState createState() => EndState();
}

class EndState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    if (CustomerServ.username == null) {
      return Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            DrawerHeader(child: Text('Please Log In or Sign Up')),
          ],
        ),
      );
    } else {
      return Drawer(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.maxFinite,
              child: Center(
                child: DrawerHeader(
                  child: Text(
                    'Quick Access',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                ),
              ),
              color: Colors.amber,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber[100]),
              child: ListTile(
                title: Text(
                  'Search Car',
                ),
                onTap: () => Navigator.push(context, CarListPage.route()),
              ),
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
                            content: Text("Are you sure?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      CustomerServ.username = null;
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => MainPage()),
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
      );
    }
  }
}
