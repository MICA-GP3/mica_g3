import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/services/main_service.dart';

class Body extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: MainSer.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error Showing');
          } else if (snapshot.hasData || snapshot.data != null) {
            return Scaffold(
                body: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    padding: EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      var mainItem = snapshot.data!.docs[index].data()
                          as Map<String, dynamic>;
                      String itemlink = mainItem['itemLink'];
                      String itemName = mainItem['itemName'];

                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            itemName,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: NetworkImage(itemlink))),
                      );
                    }));
          }
          return Center(
              child: CircularProgressIndicator(
            color: Colors.redAccent,
          ));
        });
  }
}
