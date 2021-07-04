import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/customer_profile_screen/customer_profile.dart';
import 'package:hasta_rental/services/booking_service.dart';
import 'package:hasta_rental/services/car_service.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';

class BookVM extends StatefulWidget {
  @override
  _BookVMState createState() => _BookVMState();
  final dynamic carDetails;
  final DateTime? startTime;
  final DateTime? endTime;
  final String fullname;
  final String phone;
  BookVM(
      {required this.carDetails,
      required this.startTime,
      required this.endTime,
      required this.fullname,
      required this.phone});
}

class _BookVMState extends State<BookVM> {
  Future<FirebaseApp> _initialize() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  var carDe;
  String username = CustomerServ.username!;
  String? paymentMethod;

  final _editFormkey = GlobalKey<FormState>();
  bool _isProcessing = false;

  @override
  void initState() {
    carDe = widget.carDetails.data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar(),
        body: FutureBuilder(
            future: _initialize(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error Initialized');
              } else if (snapshot.connectionState == ConnectionState.done) {
                //BUTTON FUNCTION
                buttonBook() {
                  if (paymentMethod != null) {
                    return ElevatedButton(
                        onPressed: () async {
                          int price = carDe['carPrice'];
                          int calTotal(DateTime from, DateTime to) {
                            from = DateTime(from.year, from.month, from.day,
                                from.hour, from.minute);
                            to = DateTime(
                                to.year, to.month, to.day, to.hour, to.minute);
                            return to.difference(from).inHours.round() * price;
                          }

                          if (_editFormkey.currentState!.validate()) {
                            setState(() {
                              _isProcessing = true;
                            });

                            await Booking.addBooking(
                                carName: carDe['carName'],
                                username: username,
                                custName: widget.fullname,
                                carPlate: carDe['carPlate'],
                                phone: widget.phone,
                                startTime: widget.startTime!,
                                endTime: widget.endTime!,
                                subTotal:
                                    calTotal(widget.startTime!, widget.endTime!)
                                        .toString(),
                                payment: "Paid",
                                status: "Pending");

                            await CarSer.updateCar(
                                available: false, carId: widget.carDetails.id);
                            setState(() {
                              _isProcessing = false;
                            });
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content: Text('Done Booking'),
                                    ));

                            Timer(
                                Duration(seconds: 3),
                                () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CustomerProfile()),
                                    (route) => false));
                          }
                        },
                        child: Text('Book Now'));
                  } else {
                    return Container();
                  }
                }

                //START VIEW
                return Form(
                    key: _editFormkey,
                    child: ListView(
                      padding: EdgeInsets.all(20),
                      children: [
                        Center(
                          child: Text(
                            'Payment Method',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        RadioListTile(
                            title: Text('VISA / MASTERCARD'),
                            value: 'VISA/MASTERCARD',
                            groupValue: paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                paymentMethod = value as String?;
                              });
                            }),
                        RadioListTile(
                            title: Text('ONLINE BANKING'),
                            value: 'ONLINE_BANKING',
                            groupValue: paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                paymentMethod = value as String?;
                              });
                            }),
                        RadioListTile(
                            title: Text('PAYPAL'),
                            value: 'PAYPAL',
                            groupValue: paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                paymentMethod = value as String?;
                              });
                            }),
                        _isProcessing
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : buttonBook(),
                      ],
                    ));
              }
              return CircularProgressIndicator();
            }));
  }
}
