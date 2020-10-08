import 'package:filter/models/filter.dart';
import 'package:filter/pages/home/reminder/reminder_tile.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:intl/intl.dart';

class Upcoming extends StatefulWidget {
  List<Filter> upclist;
  Upcoming(this.upclist);
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));
  Future dispalyDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
      context: context,
      initialFirstDate: _startDate,
      initialLastDate: _endDate,
      firstDate: new DateTime(DateTime.now().year - 20),
      lastDate: new DateTime(DateTime.now().year + 20),
    );
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_startDate);
    DateTime xDate = _startDate;
    _startDate =
        _startDate.subtract(Duration(hours: xDate.hour, minutes: xDate.minute));
    print(_startDate);
    final filters = widget.upclist;
    filters.sort((b, a) => b.date.compareTo(a.date));
    List<Filter> newFilters = [];
    for (var i = 0; i < filters.length; i++) {
      DateTime ndate = DateTime.parse(filters[i].expDate);
      if ((ndate.day >= _startDate.day && ndate.day <= _endDate.day) &&
          (ndate.month >= _startDate.month && ndate.month <= _endDate.month) &&
          (ndate.year >= _startDate.year && ndate.year <= _endDate.year)) {
        newFilters.add(filters[i]);
      }
      // if (ndate.isAfter(_startDate.subtract(Duration(days: 1))) &&
      //     ndate.isBefore(_endDate.subtract(Duration(days: 1)))) {
      //   newFilters.add(filters[i]);
      // }
      // if (DateFormat('dd/MM/yyyy').format(ndate) ==
      //         DateFormat('dd/MM/yyyy').format(_startDate) ||
      //     DateFormat('dd/MM/yyyy').format(ndate) ==
      //         DateFormat('dd/MM/yyyy').format(_endDate)) {
      //   newFilters.add(filters[i]);
      // }
    }
    return Scaffold(
      body: Column(children: [
        Container(
          color: Colors.transparent,
          height: 110,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: newFilters.length,
            itemBuilder: (context, index) {
              return ReminderTile(filter: newFilters[index]);
            },
          ),
        ),
      ]),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 70),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.red[800],
                  label: Text(
                    ' Upcoming ',
                    style: TextStyle(fontSize: 20),
                  ),
                  heroTag: null,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.red[500],
                  heroTag: null,
                  child: Icon(Icons.calendar_today),
                  onPressed: () {
                    dispalyDateRangePicker(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
