import 'package:filter/models/filter.dart';
import 'package:filter/pages/home/filter/filter_tile.dart';
import 'package:filter/pages/home/reminder/reminder_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReminderList extends StatefulWidget {
  @override
  _ReminderListState createState() => _ReminderListState();
}

class _ReminderListState extends State<ReminderList> {
  @override
  Widget build(BuildContext context) {
    final filters = Provider.of<List<Filter>>(context) ?? [];
    filters.sort((a, b) => b.date.compareTo(a.date));
    final today = [];
    for (var i = 0; i < filters.length; i++) {
      if (DateTime.parse(filters[i].expDate)
              .difference(DateTime.now())
              .inDays ==
          0) {
        today.add(filters[i]);
        print('done');
      }
    }

    final week = [];
    for (var i = 0; i < filters.length; i++) {
      print(
          DateTime.now().difference(DateTime.parse(filters[i].expDate)).inDays);
      int diff =
          DateTime.now().difference(DateTime.parse(filters[i].expDate)).inDays;
      if (diff > 0 && diff <= 7) {
        week.add(filters[i]);
        print('done');
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: 30,
          width: double.infinity,
          child: Text(
            'Today',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 300,
          child: today == []
              ? Center(child: Text('Nothing For Today, \n Have a Good Day'))
              : new Expanded(
                  child: ListView.builder(
                    itemCount: today.length,
                    itemBuilder: (context, index) {
                      return ReminderTile(filter: today[index]);
                    },
                  ),
                ),
        ),
        Container(
          height: 30,
          child: Text(
            'Upcoming week',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: new Expanded(
            child: ListView.builder(
              itemCount: week.length,
              itemBuilder: (context, index) {
                return ReminderTile(filter: week[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
