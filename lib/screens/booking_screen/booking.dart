import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/booking_screen/booking_vm.dart';
import 'package:hasta_rental/services/customer_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/widgets/custom_field.dart';
import 'package:hasta_rental/widgets/validate.dart';

class BookingPage extends StatefulWidget {
  final dynamic carDetails;
  final DateTime? startTime;
  final DateTime? endTime;
  @override
  _BookingPage createState() => _BookingPage();
  BookingPage(
      {required this.carDetails,
      required this.startTime,
      required this.endTime});
}

class _BookingPage extends State<BookingPage> {
  var checkbox;
  String? fullname = CustomerServ.fullname;

  FocusNode fullnamenodes = FocusNode();
  FocusNode icnodes = FocusNode();
  FocusNode licensenodes = FocusNode();
  FocusNode phonenodes = FocusNode();

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController icController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<FirebaseApp> _initialize() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: Bar(),
        //endDrawer: EndDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          //currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online),
              label: 'History',
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
              return Text('Error Initialize');
            } else if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text('Driver Details',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  CustomFormField(
                      enabled: true,
                      controller: fullnameController,
                      focusNode: fullnamenodes,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Full Name',
                      hint: 'Full Name',
                      validator: (value) =>
                          Validator.validateField(value: value)),
                  SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                      enabled: true,
                      controller: icController,
                      focusNode: icnodes,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'IC/PASSPORT',
                      hint: 'IC/PASSPORT',
                      validator: (value) =>
                          Validator.validateField(value: value)),
                  SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                      enabled: true,
                      controller: licenseController,
                      focusNode: licensenodes,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Driving License',
                      hint: 'Driving License',
                      validator: (value) =>
                          Validator.validateField(value: value)),
                  SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                      enabled: true,
                      controller: phoneController,
                      focusNode: phonenodes,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      label: 'Phone No.',
                      hint: 'Phone No.',
                      validator: (value) =>
                          Validator.validateField(value: value)),
                  SizedBox(
                    height: 24,
                  ),
                  CheckboxListTile(
                      title: Text(
                          'I agree with the terms and conditions applied. Any damages or accidents will not be covered by HASTA except for students of UTM with a maximum of RM 20000.00 in total.'),
                      value: checkbox != 1,
                      onChanged: (value) {
                        setState(() {
                          checkbox = value! ? 10 : 1;
                        });
                      }),
                  SizedBox(
                    height: 24,
                  ),
                  showButton(),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  showButton() {
    if (checkbox != 1) {
      return Container(
        child: ElevatedButton(
          child: Text('Book Now'),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookVM(
                        carDetails: widget.carDetails,
                        startTime: widget.startTime,
                        endTime: widget.endTime,
                        fullname: fullnameController.text,
                        phone: phoneController.text,
                      ))),
        ),
      );
    } else {
      return Container();
    }
  }
}
