import 'package:filter/models/filter.dart';
import 'package:filter/models/product.dart';
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

    final purchases = Provider.of<List<Product>>(context) ?? [];
    purchases.sort((a, b) => b.date.compareTo(a.date));
    List<Product> newPurchases = [];
    int purchtot = 0;
    int purchpaid = 0;
    int purchdue = 0;
    for (var i = 0; i < purchases.length; i++) {
      DateTime ndate = DateTime.parse(purchases[i].date);
      if (ndate.isAfter(_startDate) && ndate.isBefore(_endDate)) {
        newPurchases.add(purchases[i]);
        purchtot = purchtot + int.parse(purchases[i].total);
        purchpaid = purchpaid + int.parse(purchases[i].paid);
        purchdue = purchdue + int.parse(purchases[i].due);
      }
    }
    final filnum = (newFilters.length).toString();
    final servnum = (newServices.length).toString();
    final purinum = (newPurifiers.length).toString();
    final purchnum = (newPurchases.length).toString();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding: EdgeInsets.only(left: 0),
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding: EdgeInsets.only(left: 0),
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding: EdgeInsets.only(left: 0),
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding: EdgeInsets.only(left: 0),
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding: EdgeInsets.only(left: 0),
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding: EdgeInsets.only(left: 0),
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
                                '    Purchases',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
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
                      Divider(
                        color: Colors.blue[900],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    '    Number of purchase :',
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
                                  padding: EdgeInsets.only(left: 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue[900],
                                    ),
                                    width: 60,
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        '$purchnum',
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    '    Total Amount :',
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
                                  padding: EdgeInsets.only(left: 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue[900],
                                    ),
                                    width: 100,
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        '₹ $purchtot',
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    '    Total Paid :   ',
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
                                  padding: EdgeInsets.only(left: 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue[900],
                                    ),
                                    width: 100,
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        '₹ $purchpaid',
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    '    Total Due :  ',
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
                                  padding: EdgeInsets.only(left: 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue[900],
                                    ),
                                    width: 100,
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        '₹ $purchdue',
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        children: [
          Container(
            color: Colors.transparent,
            height: 50,
          ),
          Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 0, right: 0, left: 20),
                  child: FloatingActionButton.extended(
                      icon: FaIcon(FontAwesomeIcons.arrowCircleLeft),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      heroTag: null,
                      label: Text('')),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 0, left: 0, top: 0),
                  child: Text(
                    'Analytics',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, right: 0),
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
          ),
        ],
      ),
    );
  }
}
