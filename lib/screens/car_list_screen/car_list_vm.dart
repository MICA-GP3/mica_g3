import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/services/car_service.dart';

class CarVM extends StatefulWidget {
  @override
  CarVMState createState() => CarVMState();
}

class CarVMState extends State<CarVM> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: CarSer.readCar(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Connectio Error');
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var mainItem =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  String carName = mainItem['carName'];
                  String carAvail = mainItem['carAvailable'].toString();
                  return Column(
                    children: [
                      Text("CAR : $carName,$carAvail"),
                    ],
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        });
  }
}
