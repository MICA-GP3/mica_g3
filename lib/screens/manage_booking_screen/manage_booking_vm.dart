import 'package:flutter/material.dart';
import 'package:hasta_rental/services/booking_service.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/widgets/text_field.dart';

class ManageBVM extends StatefulWidget {
  final dynamic bookingDetails;
  final String bookingID;
  ManageBVM({required this.bookingDetails, required this.bookingID});

  @override
  _ManageBVMState createState() => _ManageBVMState();
}

class _ManageBVMState extends State<ManageBVM> {
  String status = '';
  @override
  void initState() {
    super.initState();
    status = widget.bookingDetails['status'];
  }

  @override
  Widget build(BuildContext context) {
    var details = widget.bookingDetails;
    var colors;
    if (details['status'] == "Pending") {
      colors = Colors.yellow;
    } else if (details['status'] == "Success") {
      colors = Colors.green;
    } else {
      colors = Colors.red;
    }
    //
    var stat = details['startTime'].millisecondsSinceEpoch;
    var startTime = DateTime.fromMillisecondsSinceEpoch(stat);

    //
    var endTime = DateTime.fromMillisecondsSinceEpoch(
        details['endTime'].millisecondsSinceEpoch);
    //print("$startTime $newStartDate");
    return Scaffold(
      appBar: Bar(),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Center(
            child: Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${details['status']}',
                  style: TextStyle(color: colors, fontSize: 20),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          TextFField(
              value: widget.bookingID, enable: false, label: 'Booking ID'),
          TextFField(
              value: details['custName'],
              enable: false,
              label: 'Customer Name'),
          TextFField(
              value: details['carName'], enable: false, label: 'Vechile Type'),
          TextFField(
              value: details['carPlate'], enable: false, label: 'Plate Number'),
          TextFField(
              value: startTime.toString(), enable: false, label: 'Pick Up'),
          TextFField(
              value: endTime.toString(), enable: false, label: 'Drop Off'),
          TextFField(
              value: details['subtotal'],
              enable: false,
              label: 'Total Payment'),
          TextFField(
              value: details['payment'],
              enable: false,
              label: 'Payment Status'),
          Divider(
            thickness: 2,
          ),
          Row(
            children: [
              Text('Booking Status: '),
              Spacer(),
              DropdownButton<String>(
                value: status,
                onChanged: (newV) {
                  setState(() {
                    status = newV!;
                  });
                },
                items: <String>[
                  'Pending',
                  'Success',
                  'Reject',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              child: Text('Confirm'),
              onPressed: () {
                Booking.updateItem(id: widget.bookingID, status: status);
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
