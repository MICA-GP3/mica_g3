import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/car_list_screen/car_list_vm.dart';
import 'package:hasta_rental/widgets/appbar.dart';
import 'package:hasta_rental/widgets/endDrawer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CarListPage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => CarListPage());
  @override
  _CarListPage createState() => _CarListPage();
}

final kNow = DateTime.now();
final kFirstDay = DateTime(kNow.year, kNow.month - 3, kNow.day);
final kLastDay = DateTime(kNow.year, kNow.month + 3, kNow.day);

class _CarListPage extends State<CarListPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  Future<FirebaseApp> _initialize() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  TimeOfDay? startTime, endTime;

  TimeOfDay? picked1, picked2;

  DateTime? startDateTime, endDateTime;

  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: Bar(),
      endDrawer: EndDrawer(),
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
            return Text('Error Connecting');
          } else if (snapshot.hasData) {
            if (_rangeStart != null) {
              startTime = TimeOfDay.fromDateTime(_rangeStart!);
            }
            if (_rangeEnd != null) {
              endTime = TimeOfDay.fromDateTime(_rangeEnd!);
            }

            selectTime(context) async {
              picked1 = await showTimePicker(
                  context: context, initialTime: startTime!);

              setState(() {
                startTime = picked1;
                startDateTime = DateTime.utc(
                    _rangeStart!.year,
                    _rangeStart!.month,
                    _rangeStart!.day,
                    picked1!.hour,
                    picked1!.minute);
                print(startDateTime);
              });
            }

            selectTime2(context) async {
              picked2 =
                  await showTimePicker(context: context, initialTime: endTime!);

              setState(() {
                endTime = picked2;
                endDateTime = DateTime.utc(
                  _rangeEnd!.year,
                  _rangeEnd!.month,
                  _rangeEnd!.day,
                  picked2!.hour,
                  picked2!.minute,
                );
                print(endDateTime);
              });
            }

            return ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Select a time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [Text('Start'), Spacer(), Text('End')],
                      ),
                      Row(
                        children: [
                          Text(
                              '${startDateTime == null ? "" : DateFormat('EEE d MMM HH:mm').format(startDateTime!)}'),
                          Spacer(),
                          Icon(Icons.arrow_forward),
                          Spacer(),
                          Text(
                            '${endDateTime == null ? "" : DateFormat('EEE d MMM HH:mm').format(endDateTime!)}',
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                TableCalendar(
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  rangeStartDay: _rangeStart,
                  rangeEndDay: _rangeEnd,
                  calendarFormat: _calendarFormat,
                  rangeSelectionMode: _rangeSelectionMode,
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        _rangeStart = null; // Important to clean those
                        _rangeEnd = null;
                        _rangeSelectionMode = RangeSelectionMode.toggledOff;
                      });
                    }
                  },
                  onRangeSelected: (start, end, focusedDay) {
                    if (end == null) {
                      setState(() {
                        _selectedDay = null;
                        _focusedDay = focusedDay;
                        _rangeStart = start;
                        _rangeEnd = start;
                        _rangeSelectionMode = RangeSelectionMode.toggledOn;
                      });
                    } else {
                      setState(() {
                        _selectedDay = null;
                        _focusedDay = focusedDay;
                        _rangeStart = start;
                        _rangeEnd = end;
                        _rangeSelectionMode = RangeSelectionMode.toggledOn;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                ElevatedButton(
                    onPressed: () {
                      selectTime2(context);
                      selectTime(context);
                    },
                    child: Text('Select Time')),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('Done'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarVM(
                                    startDate: startDateTime,
                                    enDate: endDateTime,
                                  )));
                    },
                  ),
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        },
      ),
    ));
  }
}
