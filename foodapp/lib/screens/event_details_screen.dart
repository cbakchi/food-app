import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/event_details.dart';
import 'package:food_app/screens/show_live_vide_screen.dart';
import 'package:food_app/utils/constants.dart';

import 'contact_page_screen.dart';

class EventDetailsScreen extends StatefulWidget {
  static final id = "event_details_screen";
  final EventDetails eventDetails;
  final String mode;

  const EventDetailsScreen({Key key, this.eventDetails, this.mode}) : super(key: key);
  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  bool editFlag = false;
  String mode;
  DateTime fromDate;
  DateTime toDate;
  int fromHr;
  int fromMin;

  int toHr;
  int toMin;

  String sessionName;

  @override
  void initState() {
    print(DateTime.now().toString());
    DateTime dateTime = widget.eventDetails.getDate();
    String fromTime = widget.eventDetails.getFrom();
    String toTime = widget.eventDetails.getTo();
    fromHr = int.parse(fromTime.split(":")[0]);
    fromMin = int.parse(fromTime.split(":")[1]);

    toHr = int.parse(toTime.split(":")[0]);
    toMin = int.parse(toTime.split(":")[1]);

    fromDate =
        DateTime(dateTime.year, dateTime.month, dateTime.day, fromHr, fromMin);
    toDate = DateTime(dateTime.year, dateTime.month, dateTime.day, toHr, toMin);

    sessionName = widget.eventDetails.getChannelName();
    mode = widget.mode;
    if(mode == 'add'){
      editFlag = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Session Details'),
          backgroundColor: Color(0xFF58B76E),
          centerTitle: true,
          actions: [
            editFlag
                ? IconButton(
                    icon: Icon(
                      Icons.save,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {
                      //_showPicker(context);

                      setState(() {
                        this.editFlag = !this.editFlag;
                        //Navigator.pushNamed(context, CastScreen.id);
                        //Navigator.pushNamed(context, BarCodeScanner.id);
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {
                      //_showPicker(context);
                      setState(() {
                        this.editFlag = !this.editFlag;
                        //Navigator.pushNamed(context, CastScreen.id);
                        //Navigator.pushNamed(context, BarCodeScanner.id);
                      });
                    },
                  )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                //color: Color(0xFF535252),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Session Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Color(0xFF535252)),
                    ),
                    TextFormField(
                      initialValue: sessionName,
                      enabled: editFlag ? true:false,
                      onChanged: (value){
                        setState(() {
                          sessionName = value.trim();
                        });
                      },
                    )
                  ],
                )/*InputField(
                  hint_text: 'Session name',
                  label_name: 'Session Name',
                  obscureText: false,
                  textInputType: TextInputType.name,
                  onchange_function: (value) {
                    setState(() {
                      sessionName = value.trim();
                    });
                  },
                ),*/
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Scheduled From',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF535252)
                  ),
                ),
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                //initialValue: DateTime.now().toString(),
                initialValue: fromDate.toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                enabled: editFlag ? true:false,
                onSaved: (val) => print(val),
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Scheduled To',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF535252)
                  ),
                ),
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                //initialValue: DateTime.now().toString(),
                initialValue: toDate.toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                enabled: editFlag ? true:false,
                onSaved: (val) => print(val),
              ),

              SizedBox(
                height: 30.0,
              ),
              editFlag ? Container() :
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, ShowLiveVideoScreen.id);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    color: Color(0xFF535252),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start Live Streaming',
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
