import 'package:flutter/material.dart';
import 'package:hasta_rental/services/customer_service.dart';

class EndDrawer extends StatefulWidget {
  @override
  EndState createState() => EndState();
}

class EndState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                                onPressed: () {
                                  setState(() {
                                    CustomerServ.username = null;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text("Yes")),
                            TextButton(onPressed: () {}, child: Text("No")),
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
