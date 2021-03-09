import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:food_app/components/event_details.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'event_details_screen.dart';
import 'meal_planner_screen.dart';

class LiveStreamingScreen extends StatefulWidget {
  static final id = "live_streaming_screen";
  @override
  _LiveStreamingScreenState createState() => _LiveStreamingScreenState();
}

class _LiveStreamingScreenState extends State<LiveStreamingScreen> {
  void _handleNewDate(date) {
    setState(() {
      _selectedDay = DateTime(date.year, date.month, date.day);
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  List _selectedEvents;
  DateTime _selectedDay;

  final Map<DateTime, List> _events = {
    DateTime(2021, 02, 19): [
      {'name': 'Chicken Biriany Session', 'from': '10:30', 'to': '11:30', 'isDone': true},
    ],
    DateTime(2021, 02, 20): [
      {'name': 'Fish Biriany Session', 'from': '12:30', 'to': '13:30', 'isDone': true},
      {'name': 'Egg Biriany Session', 'from': '17:30', 'to': '18:00', 'isDone': true},
    ],
    DateTime(2021, 02, 21): [
      {'name': 'Veg Biriany Session', 'from': '9:30', 'to': '11:30', 'isDone': true},
      {'name': 'Special Biriany Session', 'from': '9:30', 'to': '12:30', 'isDone': true},
    ],
    DateTime(2021, 02, 22): [
      {'name': 'Sahi Biriany Session', 'from': '10:30', 'to': '11:30', 'isDone': true},
      {'name': 'Special Biriany Session', 'from': '10:30', 'to': '11:30', 'isDone': true},
    ],
    DateTime(2021, 02, 23): [
      {'name': 'Eggless Biriany Session', 'from': '10:30', 'to': '11:30', 'isDone': true},
      {'name': 'North Indian Biriany Session', 'from': '23:30', 'to': '24:00', 'isDone': true},
    ],
    DateTime(2021, 02, 24): [
      {'name': 'Veg Biriany Session', 'from': '10:30', 'to': '11:30', 'isDone': true},
      {'name': 'Special Biriany Session', 'from': '10:30', 'to': '11:30', 'isDone': true},
    ],
  };

  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    _selectedDay = DateTime(today.year, today.month, today.day);
    //print('selected day is '+_selectedDay.toIso8601String());
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Streaming'),
        backgroundColor: Color(0xFF58B76E),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              //_showPicker(context);
              setState(() {
                EventDetails details = new EventDetails('Session for ', DateTime.now(), '00:00', '00:00', "");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventDetailsScreen(
                          eventDetails: details,
                          mode: 'add',
                        )));
              });
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: Calendar(
                startOnMonday: true,
                weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                events: _events,
                initialDate: new DateTime.now(),
                onRangeSelected: (range) =>
                    print("Range is ${range.from}, ${range.to}"),
                onDateSelected: (date) => _handleNewDate(date),
                isExpandable: true,
                eventDoneColor: Colors.green,
                selectedColor: Colors.pink,
                todayColor: Colors.blue,
                eventColor: Colors.grey,
                dayOfWeekStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 11),
              ),
            ),
            _buildEventList()
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: ListTile(
            title: Text(_selectedEvents[index]['name'].toString()),
            onTap: () {
              print(_selectedDay);

              EventDetails details = new EventDetails(_selectedEvents[index]['name'], _selectedDay, _selectedEvents[index]['from'], _selectedEvents[index]['to'], "");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EventDetailsScreen(
                          eventDetails: details,
                          mode: 'view',
                      )));
            },
          ),
        ),
        itemCount: _selectedEvents.length,
      ),
    );
  }
}
