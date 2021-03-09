import 'package:flutter/material.dart';
import 'package:food_app/screens/join_live_streaming_page.dart';

import 'live_streaming_page.dart';

class ManageStreamingPage extends StatefulWidget {
  static final id = "manage_streaming_screen";

  @override
  _ManageStreamingPageState createState() => _ManageStreamingPageState();
}

class _ManageStreamingPageState extends State<ManageStreamingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Manage Event'),
          backgroundColor: Color(0xFF58B76E),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          child: ListView(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, LiveStreamingScreen.id);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  color: Color(0xFF535252),
                  child: Center(
                    child: Text(
                      'Schedule Live Streaming',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: (){
                  //Navigator.pushNamed(context, LiveStreamingScreen.id);
                  Navigator.pushNamed(context, JoinLiveStramingPage.id);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  color: Color(0xFF535252),
                  child: Center(
                    child: Text(
                      'Join Session',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
