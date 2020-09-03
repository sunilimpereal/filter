import 'package:filter/models/filter.dart';
import 'package:filter/pages/home/filter/filter_form.dart';
import 'package:filter/pages/home/filter/filter_list.dart';
import 'package:filter/pages/home/reminder/reminder.dart';
import 'package:flutter/material.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

class ReminderHome extends StatefulWidget {
  @override
  _ReminderHomeState createState() => _ReminderHomeState();
}

class _ReminderHomeState extends State<ReminderHome> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<Filter>>.value(
      value: DatabaseService(uid: user.uid).filterList,
      child: Scaffold(
        backgroundColor: Color(0xFFe5e5e5),
        appBar: GradientAppBar(
          elevation: 0.0,
          title: Text('Notification'),
        ),
        body: ReminderList(),
      ),
    );
  }
}
