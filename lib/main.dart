//SCSJ3623 MOBILE APPLICATION PROGRAMMING
//SECTION 02
//DR. JOHANNA AHMAD
//GROUP3 - MICA [MIDAH - ISAAC - CHU NING - ATIQAH]
//HASTA CAR RENTAL

import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/main_screen/mainpage.dart';
import 'package:hasta_rental/screens/booking_history_screen/booking_history.dart';

void main() => runApp(MaterialApp(
      title: 'Hasta Car Rental',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: BookingHistoryPage(),
    ));
