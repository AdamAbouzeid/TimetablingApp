import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:table_calendar/table_calendar.dart';

User? loggedinUser;

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _auth = FirebaseAuth.instance;
  late CalendarController _calendarController;
  late TextEditingController _eventController;
  late Map<DateTime,List<dynamic>> _events;
  late List<dynamic> _selectedEvents;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _calendarController = CalendarController();
    _events = {};
    _eventController = TextEditingController();
    _selectedEvents = [];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _calendarController.dispose();
    super.dispose();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Adam's Timetabling App"), backgroundColor: Colors.red,),
        body: TableCalendar(calendarController: _calendarController,
          events: _events
        ),
        floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: _showAddDialog,
    )
    );
  }

  _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _eventController
        ),
            actions: <Widget> [
              FlatButton(
                child: const Text("Save"),
                onPressed: (){
                  if(_eventController.text.isEmpty) return;
                  setState(() {
                    if(_events[_calendarController.selectedDay] != null) {
                      _events[_calendarController.selectedDay]?.add(_eventController.text);
                    } else {
                      _events[_calendarController.selectedDay] = [_eventController.text];
                    }
                    _eventController.clear();
                    Navigator.pop(context);
                  });
                },
              )
            ]
      )
    );
  }
}