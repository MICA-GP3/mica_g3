import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/services/booking_service.dart';
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

  @override
  void initState() {
    carDe = widget.carDetails;
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
                return ElevatedButton(
                    onPressed: () async {
                      int price = carDe['carPrice'];
                      int calTotal(DateTime from, DateTime to) {
                        from = DateTime(from.year, from.month, from.day);
                        to = DateTime(to.year, to.month, to.day);
                        return to.difference(from).inHours.round() * price;
                      }

                      await Booking.addBooking(
                          carName: carDe['carName'],
                          username: username,
                          custName: widget.fullname,
                          carPlate: carDe['carPlate'],
                          phone: widget.phone,
                          startTime: widget.startTime!,
                          endTime: widget.endTime!,
                          subTotal: calTotal(widget.startTime!, widget.endTime!)
                              .toString(),
                          payment: "Paid",
                          status: "Pending");

                      Text('Done Booking');
                    },
                    child: Text('Book Now'));
              }
              return CircularProgressIndicator();
            }));
  }
}
