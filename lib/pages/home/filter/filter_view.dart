import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/classes/dateremin.dart';
import 'package:filter/classes/sms.dart';
import 'package:filter/models/filter.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/filter/filter_edit.dart';
import 'package:filter/pages/home/filter/filter_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:filter/services/database.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class FilterView extends StatefulWidget {
  final String id;
  FilterView({this.id});
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    Future<Filter> _getFilter() async {
      String id = widget.id;
      final user = Provider.of<User>(context);
      DocumentSnapshot filtersnap = await DatabaseService(uid: user.uid)
          .filterCollection
          .document(user.uid)
          .collection('FilterList')
          .document(id)
          .get();
      Filter filter = DatabaseService().filterFromSnapshot(filtersnap);
      print(filter);
      return filter;
    }

    return Scaffold(
      // appBar: GradientAppBar(
      //   backgroundColorStart: Color(0xFF153243),
      //   backgroundColorEnd: Color(0xFF235470),
      //   title: Text('Filter Change'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.delete,
      //         color: Colors.white,
      //       ),
      //       iconSize: 30,
      //       onPressed: () {
      //         showAlertDialog(context, user.uid, widget.id);
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.edit),
      //       iconSize: 30.0,
      //       onPressed: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => FilterEdit(
      //                       id: widget.id,
      //                     )));
      //       },
      //     )
      //   ],
      // ),
      body: FutureBuilder(
        future: _getFilter(),
        builder: (BuildContext context, AsyncSnapshot<Filter> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.number);
            return Container(
                child: _View(
                    snapshot.data.name,
                    snapshot.data.number,
                    snapshot.data.address,
                    snapshot.data.model,
                    snapshot.data.price,
                    snapshot.data.paid,
                    snapshot.data.due,
                    snapshot.data.date,
                    snapshot.data.expDate));
          } else {
            return Center(
              child: Loading(
                  indicator: BallPulseIndicator(),
                  size: 100.0,
                  color: Colors.blue),
            );
          }
        },
      ),
      floatingActionButton: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 620, left: 270),
          child: FloatingActionButton.extended(
            heroTag: null,
            icon: FaIcon(FontAwesomeIcons.edit),
            label: Text(''),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilterEdit(
                            id: widget.id,
                          )));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 270),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.red[400],
            heroTag: null,
            icon: Icon(Icons.delete),
            label: Text(''),
            onPressed: () {
              showAlertDialog(context, user.uid, widget.id);
            },
          ),
        ),
      ]),
    );
  }
}

class _View extends StatelessWidget {
  final String name;
  final String number;
  final String address;
  final String model;
  final String price;
  final String paid;
  final String due;
  final String date;
  final String expDate;

  _View(
    this.name,
    this.number,
    this.address,
    this.model,
    this.price,
    this.paid,
    this.due,
    this.date,
    this.expDate,
  );
  @override
  Widget build(BuildContext context) {
    String datedisp = DateFormat.yMd().format(DateTime.parse(date ?? ''));
    String expDate1 = DateFormat.yMd().format(DateTime.parse(expDate ?? ''));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 150, left: 20),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Name : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    '  $name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Phone : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    '  $number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Address : ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  width: 180,
                  child: Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      '$address',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Model : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    '  $model',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Price  : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    '   ₹ $price',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Last Installation Date  : ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    ' $datedisp',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Next Installation Date  : ',
                    style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    ' $expDate1',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 60, right: 260),
          child: FloatingActionButton.extended(
            icon: Icon(Icons.arrow_back),
            label: Text(''),
            heroTag: null,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0, left: 270),
          child: FloatingActionButton.extended(
            icon: Icon(Icons.call),
            label: Text(''),
            onPressed: () {
              launch("tel:$number");
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 270),
          child: FloatingActionButton.extended(
            heroTag: null,
            icon: FaIcon(FontAwesomeIcons.sms),
            label: Text(''),
            onPressed: () {
              sendSms(number, expDate);
              final snackBar = SnackBar(
                content: Text('Message Sent to $name'),
                action: SnackBarAction(
                  label: '',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 270),
          child: FloatingActionButton.extended(
            heroTag: null,
            icon: FaIcon(FontAwesomeIcons.whatsapp),
            label: Text(''),
            onPressed: () {
              FlutterOpenWhatsapp.sendSingleMessage("+91$number",
                  "Your Water Purifier Filter replace date is $date\nBy SMART AQUA PURIFIER\nBala Chandar | 9534989863\nChange Outer Filter every three months for long life");
              final snackBar = SnackBar(
                content: Text('Message Sent to $name'),
                action: SnackBarAction(
                  label: '',
                  onPressed: () {},
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ]),
    );
  }
}

showAlertDialog(BuildContext context, String uid, String id) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = FlatButton(
    child: Text(
      "Confirm",
      style: TextStyle(color: Colors.red),
    ),
    onPressed: () {
      DatabaseService(uid: uid).deleteFilter(id);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FilterHome()));
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirm Delete"),
    content: Text("Would you like to delete the task?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
