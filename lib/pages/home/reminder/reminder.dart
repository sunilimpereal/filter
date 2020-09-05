import 'package:filter/models/filter.dart';
import 'package:filter/pages/home/reminder/reminder_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReminderList extends StatefulWidget {
  @override
  _ReminderListState createState() => _ReminderListState();
}

class _ReminderListState extends State<ReminderList> {
  @override
  DateTime curDate = DateTime.now();
  Widget build(BuildContext context) {
    final filters = Provider.of<List<Filter>>(context) ?? [];
    filters.sort((a, b) => b.date.compareTo(a.date));
    print(filters);
    List<Filter> today = List<Filter>();
    for (var i = 0; i < filters.length; i++) {
      DateTime exDate = DateTime.parse(filters[i].expDate);
      if (exDate.day == curDate.day &&
          exDate.month == curDate.month &&
          exDate.year == curDate.year) {
        today.add(filters[i]);
        print('done');
      }
    }
    print(today);

    List<Filter> week = List<Filter>();
    for (var i = 0; i < filters.length; i++) {
      print(filters[i].expDate);
      print(
          DateTime.now().difference(DateTime.parse(filters[i].expDate)).inDays);
      int diff =
          DateTime.now().difference(DateTime.parse(filters[i].expDate)).inDays;
      if (diff <= 0 && diff >= -7) {
        week.add(filters[i]);
        print('done');
      }
      print(week);
    }
    List<Filter> weekr = week.reversed.toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: Colors.grey,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: 25,
          width: double.infinity,
          child: Text(
            'Today',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 300,
          child: // (() {
              // if (today != []) {
              //   return Center(
              //     child: Text(
              //       'Nothing For Today \n Have a nice day',
              //       style: TextStyle(
              //           fontWeight: FontWeight.w500, color: Colors.black),
              //     ),
              //   );
              // } else {
              Expanded(
            child: ListView.builder(
              itemCount: today.length,
              itemBuilder: (context, index) {
                return ReminderTile(filter: today[index]);
              },
            ),
          ),
        ),
        Container(
          color: Colors.grey,
          width: double.infinity,
          height: 25,
          child: Text(
            '        Upcoming',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(
          child: new Expanded(
            child: ListView.builder(
              itemCount: weekr.length,
              itemBuilder: (context, index) {
                return ReminderTile(filter: weekr[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
