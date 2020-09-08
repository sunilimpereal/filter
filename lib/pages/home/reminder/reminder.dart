import 'package:filter/models/filter.dart';
import 'package:filter/pages/home/reminder/reminder_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReminderList extends StatefulWidget {
  @override
  _ReminderListState createState() => _ReminderListState();
}

class _ReminderListState extends State<ReminderList> {
  bool t = true;
  Color color = Colors.blue;
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

      //  Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => FilterEdit(
      //                         id: widget.id,
      //                       )));
      // mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.max,
      // children: [
      //   SizedBox(
      //     height: 5,
      //   ),
      //   Row(children: [
      //     SizedBox(
      //       width: 30,
      //     ),
      //     Container(
      //       height: 40,
      //       width: 80,
      //       decoration: BoxDecoration(
      //         color: Colors.red[800],
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //       child: Padding(
      //         padding: EdgeInsets.only(left: 18, right: 10, top: 8),
      //         child: Text(
      //           'Today',
      //           style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 16,
      //               color: Colors.white),
      //         ),
      //       ),
      //     ),
      //   ]),
      //   Container(
      //     height: 300,
      //     // child: // (() {
      //     //     // if (today != []) {
      //     //     //   return Center(
      //     //     //     child: Text(
      //     //     //       'Nothing For Today \n Have a nice day',
      //     //     //       style: TextStyle(
      //     //     //           fontWeight: FontWeight.w500, color: Colors.black),
      //     //     //     ),
      //     //     //   );
      //     //     // } else {
      //     child: Expanded(
      //       child: ListView.builder(
      //         itemCount: today.length,
      //         itemBuilder: (context, index) {
      //           return ReminderTile(filter: today[index]);
      //         },
      //       ),
      //     ),
      //   ),
      //   Row(children: [
      //     SizedBox(
      //       width: 30,
      //     ),
      //     Container(
      //       height: 40,
      //       width: 100,
      //       decoration: BoxDecoration(
      //         color: Colors.blue[800],
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //       child: Padding(
      //         padding: EdgeInsets.only(left: 10, right: 10, top: 8),
      //         child: Text(
      //           'Upcoming',
      //           style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 16,
      //               color: Colors.white),
      //         ),
      //       ),
      //     ),
      //   ]),
      //   Container(
      //     child: new Expanded(
      //       child: ListView.builder(
      //         itemCount: weekr.length,
      //         itemBuilder: (context, index) {
      //           return ReminderTile(filter: weekr[index]);
      //         },
      //       ),
      //     ),
      //   ),
      // ],
      // ),
      floatingActionButton: Column(
        children: [
          Row(
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
                            builder: (context) => upcoming1(weekr)));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget upcoming1(List<Filter> week1) {
    return Scaffold(
      body: Column(children: [
        Container(
          color: Colors.transparent,
          height: 120,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: week1.length,
            itemBuilder: (context, index) {
              return ReminderTile(filter: week1[index]);
            },
          ),
        ),
      ]),
      floatingActionButton: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40, top: 70),
                child: FloatingActionButton.extended(
                  label: Text(
                    '   Today   ',
                    style: TextStyle(fontSize: 20),
                  ),
                  heroTag: null,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 70),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text(
                    ' Upcoming ',
                    style: TextStyle(fontSize: 20),
                  ),
                  heroTag: null,
                  onPressed: () {
                    t = false;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
