import 'package:filter/models/filter.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/service.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
    final purifiers = Provider.of<List<Purifier>>(context) ?? [];
    purifiers.sort((a, b) => b.date.compareTo(a.date));
    List<Purifier> newPurifiers = [];
    int puriinc = 0;
    for (var i = 0; i < purifiers.length; i++) {
      DateTime ndate = DateTime.parse(purifiers[i].date);
      if (ndate.isAfter(_startDate) && ndate.isBefore(_endDate)) {
        newPurifiers.add(purifiers[i]);
        puriinc = puriinc + int.parse(purifiers[i].price) ?? '0';
      }
    }
    print(newPurifiers);
    final filters = Provider.of<List<Filter>>(context) ?? [];
    filters.sort((a, b) => b.date.compareTo(a.date));
    List<Filter> newFilters = [];
    int filinc = 0;
    for (var i = 0; i < filters.length; i++) {
      DateTime ndate = DateTime.parse(filters[i].date);
      if (ndate.isAfter(_startDate) && ndate.isBefore(_endDate)) {
        newFilters.add(filters[i]);
        filinc = filinc + int.parse(filters[i].price);
      }
    }
    print(newFilters);
    final services = Provider.of<List<Service>>(context) ?? [];
    services.sort((a, b) => b.date.compareTo(a.date));
    print(services);
    List<Service> newServices = [];
    int servinc = 0;
    for (var i = 0; i < services.length; i++) {
      DateTime ndate = DateTime.parse(services[i].date);
      if (ndate.isAfter(_startDate) && ndate.isBefore(_endDate)) {
        newServices.add(services[i]);
        servinc = servinc + int.parse(services[i].price);
      }
    }

    final filnum = (newFilters.length).toString();
    final servnum = (newServices.length).toString();
    final purinum = (newPurifiers.length).toString();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 140,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Center(
                              child: Text(
                                '    Filter Changes',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Text(
                              '    Number of Filter Change :',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[900],
                              ),
                              width: 60,
                              height: 30,
                              child: Center(
                                child: Text(
                                  '$filnum',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Text(
                              '    Total Income :',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 120),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[900],
                              ),
                              width: 80,
                              height: 30,
                              child: Center(
                                child: Text(
                                  '₹ $filinc',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Center(
                              child: Text(
                                '    Services',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Text(
                              '    Number of Services :',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 90),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[900],
                              ),
                              width: 60,
                              height: 30,
                              child: Center(
                                child: Text(
                                  '$servnum',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Text(
                              '    Total Income :',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 120),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[900],
                              ),
                              width: 80,
                              height: 30,
                              child: Center(
                                child: Text(
                                  '₹ $servinc',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Center(
                              child: Text(
                                '    Installations',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Text(
                              '    Number of Install :',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 110),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[900],
                              ),
                              width: 60,
                              height: 30,
                              child: Center(
                                child: Text(
                                  '$purinum',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Text(
                              '    Total Income :',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 130),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[900],
                              ),
                              width: 80,
                              height: 30,
                              child: Center(
                                child: Text(
                                  '₹ $puriinc',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60, right: 0, left: 30),
                child: FloatingActionButton.extended(
                    icon: FaIcon(FontAwesomeIcons.arrowCircleLeft),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    heroTag: null,
                    label: Text('')),
              ),
              Padding(
                padding: EdgeInsets.only(right: 50, left: 63, top: 60),
                child: Text(
                  'Analytics',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60, right: 0),
                child: FloatingActionButton.extended(
                    heroTag: null,
                    icon: FaIcon(FontAwesomeIcons.calendarAlt),
                    onPressed: () {
                      dispalyDateRangePicker(context);
                    },
                    label: Text('')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
