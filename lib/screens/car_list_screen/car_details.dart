import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/booking_screen/booking.dart';
import 'package:hasta_rental/widgets/appbar.dart';

class CarDetail extends StatefulWidget {
  @override
  CarDS createState() => CarDS();

  CarDetail(
      {required this.carDetails,
      required this.startTime,
      required this.endTime});

  final carDetails;
  final DateTime? startTime;
  final DateTime? endTime;
}

class CarDS extends State<CarDetail> {
  @override
  Widget build(BuildContext context) {
    var carDe = widget.carDetails.data() as Map<String, dynamic>;
    return Scaffold(
      appBar: Bar(),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Image.network(
                  carDe['carImg'],
                  fit: BoxFit.fitWidth,
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  Text(
                    "${carDe['carName']}\n",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Color:\t${carDe['carColor']} \n\nType:\t${carDe['carType']} \n\nPrice:\tRM${carDe['carPrice']}/Hour",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.people,
                      ),
                      Text('5')
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Icon(
                        Icons.flaky_rounded,
                      ),
                      Text('Aircon')
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Icon(
                        Icons.door_sliding,
                      ),
                      Text('4')
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [Icon(Icons.luggage), Text('1')],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Icon(
                        Icons.gamepad_rounded,
                      ),
                      Text('Automatic')
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  child: Text('Book Now'),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookingPage(
                                carDetails: carDe,
                                startTime: widget.startTime,
                                endTime: widget.endTime,
                              ))),
                ),
              )
            ],
          )),
    );
  }
}
