import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class Pbutton extends StatefulWidget {
  @override
  _PbuttonState createState() => _PbuttonState();
}

class _PbuttonState extends State<Pbutton> {
  ButtonState stateTextWithIcon = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: progressBtn(),
    );
  }

  Widget progressBtn() {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle: IconedButton(
          text: "Save",
          icon: Icon(Icons.send, color: Colors.white),
          color: Colors.deepPurple.shade500),
      ButtonState.loading:
          IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
      ButtonState.fail: IconedButton(
          text: "Failed",
          icon: Icon(Icons.cancel, color: Colors.white),
          color: Colors.red.shade300),
      ButtonState.success: IconedButton(
          text: "Success",
          icon: Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          color: Colors.green.shade400)
    }, onPressed: onPressedprogressBtn, state: stateTextWithIcon);
  }

  void onPressedprogressBtn() {
    if (stateTextWithIcon == ButtonState.idle) {
      stateTextWithIcon = ButtonState.loading;
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          stateTextWithIcon = Random.secure().nextBool()
              ? ButtonState.success
              : ButtonState.fail;
        });
      });
    }

    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
  }
}
