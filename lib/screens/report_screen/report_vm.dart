import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/services/report_service.dart';
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
  @override
  Widget build(BuildContext context) {
    // var details = widget.bookingDetails;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<QuerySnapshot>(
            future: ReportService.readItems(),
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
                          String car = mainItem['carName'];
                          String carPlate = mainItem['carPlate'];

                          return Container(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                // ""
                                "$carPlate",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }));
              }
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.redAccent,
              ));
            })

        // Scaffold(
        //     body: ListView(children: <Widget>[
        //   Center(
        //       child: Text(
        //     'Business Report',
        //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        //   )),
        //   DataTable(
        //     columns: [
        //       DataColumn(
        //           label: Text('Car',
        //               style:
        //                   TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        //       DataColumn(
        //           label: Text('Booking Count',
        //               style:
        //                   TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        //     ],
        //     rows: [
        //       DataRow(cells: [
        //         DataCell(Text('Myvi')),
        //         DataCell(Text('4')),
        //       ]),
        //       DataRow(cells: [
        //         DataCell(Text('Bezza')),
        //         DataCell(Text('2')),
        //       ]),
        //       DataRow(cells: [
        //         DataCell(Text('X70')),
        //         DataCell(Text('1')),
        //       ]),
        //     ],
        //   ),
        // ])),
        );
  }
}
