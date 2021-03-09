import 'package:flutter/material.dart';

class AlertDialogWidget {

  final List<Text> messages;
  final Function action;
  final BuildContext context;

  const AlertDialogWidget({Key key,@required this.messages,this.action,@required this.context});

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: messages,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            action != null ? FlatButton(
              child: Text('Ok'),
              onPressed: action,
            ): null,
          ],
        );
      },
    );
  }
}