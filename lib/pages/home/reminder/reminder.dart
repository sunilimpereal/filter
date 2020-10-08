import 'package:filter/models/filter.dart';
import 'package:filter/pages/home/reminder/reminder_tile.dart';
import 'package:filter/pages/home/reminder/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReminderList extends StatefulWidget {
  @override
  _ReminderListState createState() => _ReminderListState();
}

class _ReminderListState extends State<ReminderList> {
  bool t = true;
  Color color = Colors.blue;
  DateTime curDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final filters = Provider.of<List<Filter>>(context) ?? [];
    filters.sort((a, b) => b.date.compareTo(a.date));

    List<Filter> today = List<Filter>();
    for (var i = 0; i < filters.length; i++) {
      DateTime exDate = DateTime.parse(filters[i].expDate);
      if (exDate.day == curDate.day &&
          exDate.month == curDate.month &&
          exDate.year == curDate.year) {
        today.add(filters[i]);
      }
    }
    print(today);

    List<Filter> week = List<Filter>();
    for (var i = 0; i < filters.length; i++) {
      print(filters[i].expDate);

      int diff =
          DateTime.now().difference(DateTime.parse(filters[i].expDate)).inDays;
      if (diff <= 0 && diff >= -7) {
        week.add(filters[i]);
        print('done');
      }
      print(week);
    }
    List<Filter> weekr = week.reversed.toList();

    return Scaffold(
      body: Column(children: [
        Container(
          color: Colors.transparent,
          height: 120,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: today.length,
            itemBuilder: (context, index) {
              return ReminderTile(filter: today[index]);
            },
          ),
        ),
      ]),
      floatingActionButton: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40, top: 70),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.red[800],
                  label: Text(
                    '   Today   ',
                    style: TextStyle(fontSize: 20),
                  ),
                  heroTag: null,
                  onPressed: () {
                    t = true;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 70),
                child: FloatingActionButton.extended(
                  label: Text(
                    ' Upcoming ',
                    style: TextStyle(fontSize: 20),
                  ),
                  heroTag: null,
                  onPressed: () {
                    setState(() {
                      color = Colors.red[800];
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Upcoming(filters)));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget upcoming(List<Filter> week1) {
  //   return Scaffold(
  //     body: Column(children: [
  //       Container(
  //         color: Colors.transparent,
  //         height: 120,
  //       ),
  //       Expanded(
  //         child: ListView.builder(
  //           itemCount: week1.length,
  //           itemBuilder: (context, index) {
  //             return ReminderTile(filter: week1[index]);
  //           },
  //         ),
  //       ),
  //     ]),
  //     floatingActionButton: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Row(
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.only(left: 40, top: 70),
  //                   child: FloatingActionButton.extended(
  //                     label: Text(
  //                       '   Today   ',
  //                       style: TextStyle(fontSize: 20),
  //                     ),
  //                     heroTag: null,
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(left: 20, top: 70),
  //               child: FloatingActionButton.extended(
  //                 backgroundColor: Colors.red[800],
  //                 label: Text(
  //                   ' Upcoming ',
  //                   style: TextStyle(fontSize: 20),
  //                 ),
  //                 heroTag: null,
  //                 onPressed: () {
  //                   t = false;
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //         Container(
  //           width: MediaQuery.of(context).size.width,
  //           color: Colors.transparent,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               FloatingActionButton(
  //                 backgroundColor: Colors.red,
  //                 heroTag: null,
  //                 child: Icon(Icons.calendar_today),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
