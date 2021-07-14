import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/services/booking_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/widgets/text_field.dart';

class TableReportPage extends StatefulWidget {
  // final dynamic bookingDetails;
  // final String bookingID;
  // TableReportPage({required this.bookingDetails, required this.bookingID});

  @override
  _TableReportPage createState() => _TableReportPage();
}

class _TableReportPage extends State<TableReportPage> {
  String status = '';
  @override
  // void initState() {
  //   super.initState();
  //   status = widget.bookingDetails['status'];
  // }

  @override
  Widget build(BuildContext context) {
    // var details = widget.bookingDetails;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView(children: <Widget>[
        Center(
            child: Text(
          'Business Report',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        DataTable(
          columns: [
            DataColumn(
                label: Text('Car',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Booking Count',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Myvi')),
              DataCell(Text('4')),
            ]),
            DataRow(cells: [
              DataCell(Text('Bezza')),
              DataCell(Text('2')),
            ]),
            DataRow(cells: [
              DataCell(Text('X70')),
              DataCell(Text('1')),
            ]),
          ],
        ),
      ])),
    );
  }
}
