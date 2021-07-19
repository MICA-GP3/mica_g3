//SCSJ3623 MOBILE APPLICATION PROGRAMMING
//SECTION 02
//TS. DR. JOHANNA AHMAD
//GROUP3 - MICA [MIDAH - ISAAC - CHU NING - ATIQAH]
//HASTA CAR RENTAL
//GROUP MEMBERS:
// 1. ISAAC TAN YU HAO (B19EC0010)
// 2. KANG CHU NING (B19EC0011)
// 3. NUR ATIQAH BINTI MOHD FUA'AD (B19EC0032)
// 4. SITI HAMIDAH BINTI MOHD AZWAN TAN (B19EC0038)

import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/main_screen/mainpage.dart';

void main() => runApp(MaterialApp(
      title: 'Hasta Car Rental',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MainPage(),
    ));
