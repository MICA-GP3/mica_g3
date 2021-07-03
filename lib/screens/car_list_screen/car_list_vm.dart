import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/car_list_screen/car_details.dart';
import 'package:hasta_rental/services/car_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';

class CarVM extends StatefulWidget {
  @override
  CarVMState createState() => CarVMState();
  final DateTime? startDate;
  final DateTime? enDate;

  CarVM({required this.startDate, required this.enDate});
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
            return Scaffold(
              appBar: Bar(),
              body: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        thickness: 2,
                      ),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var mainItem = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    var carID = snapshot.data!.docs;
                    String carName = mainItem['carName'];
                    String carColor = mainItem['carColor'];
                    String carType = mainItem['carType'];
                    int carPrice =
                        mainItem['carPrice'] == null ? 0 : mainItem['carPrice'];
                    String carImg = mainItem['carImg'];
                    return Row(
                      children: [
                        Container(
                          child: Text(
                            '-------------------------------------------------------- \n',
                            style: TextStyle(color: Colors.transparent),
                          ),
                          height: 200,
                          decoration: BoxDecoration(
                              image:
                                  DecorationImage(image: NetworkImage(carImg))),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              "Brand : $carName \nColor: $carColor \nPrice: RM$carPrice/Hour \nType: $carType",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CarDetail(
                                              carDetails: carID[index],
                                              startTime: widget.startDate,
                                              endTime: widget.enDate,
                                            ))),
                                child: Text('Book Now'))
                          ],
                        ),
                      ],
                    );
                  }),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        });
  }
}
