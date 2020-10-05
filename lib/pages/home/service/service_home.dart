import 'package:filter/models/service.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/service/service_form.dart';
import 'package:filter/pages/home/service/service_list.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ServiceHome extends StatefulWidget {
  @override
  _ServiceHomeState createState() => _ServiceHomeState();
}

class _ServiceHomeState extends State<ServiceHome> {
  DateTime curDate = DateTime.now();
  DateTime _startDate = DateTime(DateTime.now().year - 20);

  DateTime _endDate = DateTime(DateTime.now().year + 20);

  Future dispalyDateRangePicker(BuildContext context) async {
    print(_startDate);
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
      context: context,
      initialFirstDate:
          (DateTime.now()).subtract(Duration(days: ((DateTime.now().day) - 1))),
      initialLastDate: (DateTime.now())
          .subtract(Duration(days: (DateTime.now().day) - 1))
          .add(Duration(days: 29)),
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
    return StreamProvider<List<Service>>.value(
      value: DatabaseService(uid: user.uid).serviceList,
      child: Scaffold(
        backgroundColor: Color(0xFFFDFFFC),
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.blue[300],
        //   title: Text(
        //     'Services',
        //     style: TextStyle(color: Color(0xFF153243)),
        //   ),
        //   leading: new IconButton(
        //     icon: new Icon(
        //       Icons.arrow_back,
        //       color: Color(0xFF153243),
        //     ),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => Home()),
        //       );
        //     },
        //   ),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.insert_invitation),
        //       iconSize: 25.0,
        //       onPressed: () {
        //         dispalyDateRangePicker(context);
        //       },
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.add),
        //       iconSize: 30.0,
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => ServiceForm()));
        //       },
        //     ),
        //   ],
        // ),
        body: Column(children: [
          SizedBox(
            height: 70,
          ),
          Expanded(
            child: ServiceList(
              startDate: _startDate,
              endDate: _endDate,
            ),
          ),
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
                                    builder: (context) => ServiceForm()));
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
