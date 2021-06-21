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
  int _index = 0;
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
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
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
                              '${_rangeStart == null ? "" : DateFormat('EEE d MMM').format(_rangeStart!)}'),
                          Spacer(),
                          Icon(Icons.arrow_forward),
                          Spacer(),
                          Text(
                              '${_rangeEnd == null ? "" : DateFormat('EEE d MMM').format(_rangeEnd!)}'),
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
                    setState(() {
                      _selectedDay = null;
                      _focusedDay = focusedDay;
                      _rangeStart = start;
                      _rangeEnd = end;
                      _rangeSelectionMode = RangeSelectionMode.toggledOn;
                    });
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
                                    startDate: _rangeStart,
                                    enDate: _rangeEnd,
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
