import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/services/report_service.dart';
import 'package:pie_chart/pie_chart.dart';

class TableReportPage extends StatefulWidget {
  TableReportPage();

  @override
  _TableReportPage createState() => _TableReportPage();
}

class _TableReportPage extends State<TableReportPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<QuerySnapshot>(
            future: ReportService.readItems(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error Showing');
              } else if (snapshot.hasData || snapshot.data != null) {
                var number = snapshot.data!.docs.length;
                var details;
                var total = Map();
                List<String> cars = [];
                for (int i = 0; i < number; i++) {
                  details = snapshot.data!.docs[i].data();
                  cars.add(details['carName']);
                }
                cars.forEach((element) => total[element] =
                    !total.containsKey(element) ? (1) : (total[element] + 1));
                print("$cars : $total ");
                Map<String, double> dataM =
                    total.map((key, value) => MapEntry(key, value?.toDouble()));
                return Scaffold(
                    body: Container(
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            'Report Car Sales',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      Divider(
                        height: 5,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      PieChart(
                        dataMap: dataM,
                      ),
                    ],
                  ),
                ));
              }
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.redAccent,
              ));
            }));
  }
}
