import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/rounded_button.dart';
import 'package:food_app/screens/rtmp_receiver_screen.dart';

import 'contact_page_screen.dart';

class JoinLiveStramingPage extends StatefulWidget {
  static final id = "join_live_streaming_screen";

  @override
  _JoinLiveStramingPageState createState() => _JoinLiveStramingPageState();
}

class _JoinLiveStramingPageState extends State<JoinLiveStramingPage> {
  String liveUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Join Events'),
          backgroundColor: Color(0xFF58B76E),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
          child: ListView(
            children: [
              InputField(
                hint_text: 'Stream URL',
                label_name: 'URL Link',
                obscureText: false,
                textInputType: TextInputType.emailAddress,
                onchange_function: (value) {
                  setState(() {
                    liveUrl = value.trim();
                  });
                },
              ),
              SizedBox(
                height: 25.0,
              ),
              RoundedButton(
                buttonColor: Color(0xFF58B76E),
                buttonAction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RtmpReceiverScreen(
                            liveUrl: liveUrl,
                          )));
                },
                buttonName: 'Start',
              )
              /*_RTMPVideo()*/
            ],
          ),
        ),
      ),
    );
  }
}