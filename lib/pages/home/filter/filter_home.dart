import 'package:filter/models/filter.dart';
import 'package:filter/pages/home/filter/filter_form.dart';
import 'package:filter/pages/home/filter/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class FilterHome extends StatefulWidget {
  @override
  _FilterHomeState createState() => _FilterHomeState();
}

class _FilterHomeState extends State<FilterHome> {
  DateTime curDate = DateTime.now();
  DateTime _startDate =
      (DateTime.now()).subtract(Duration(days: ((DateTime.now().day) - 1)));

  DateTime _endDate = (DateTime.now())
      .subtract(Duration(days: (DateTime.now().day) - 1))
      .add(Duration(days: 29));

  Future dispalyDateRangePicker(BuildContext context) async {
    print(_startDate);
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
    final user = Provider.of<User>(context);
    return StreamProvider<List<Filter>>.value(
      value: DatabaseService(uid: user.uid).filterList,
      child: Scaffold(
        // appBar: GradientAppBar(
        //   elevation: 0.0,
        //   backgroundColorStart: Color(0xFF153243),
        //   backgroundColorEnd: Color(0xFF153243),
        //   title: Text('Filters'),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.insert_invitation),
        //       iconSize: 30.0,
        //       onPressed: () {
        //         dispalyDateRangePicker(context);
        //       },
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.add),
        //       iconSize: 30.0,
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => FilterForm()));
        //       },
        //     )
        //   ],
        // ),
        body: Column(children: [
          SizedBox(
            height: 70,
            child: Text('Filter'),
          ),
          Expanded(
              child: FilterList(
            startDate: _startDate,
            endDate: _endDate,
          )),
        ]),
        floatingActionButton: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0, right: 0, left: 20),
                    child: FloatingActionButton.extended(
                      label: Text(''),
                      heroTag: null,
                      icon: FaIcon(FontAwesomeIcons.arrowCircleLeft),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 0),
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.blue,
                          icon: FaIcon(FontAwesomeIcons.calendarAlt),
                          label: Text(''),
                          heroTag: null,
                          onPressed: () {
                            dispalyDateRangePicker(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 10),
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.green,
                          icon: Icon(Icons.add),
                          label: Text('New  '),
                          heroTag: null,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FilterForm()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
