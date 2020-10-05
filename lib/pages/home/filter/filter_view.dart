import 'package:cloud_firestore/cloud_firestore.dart';
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
      appBar: AppBar(
        title: Text(
          'Filter Detail',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFebebeb),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilterEdit(
                            id: widget.id,
                          )));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showAlertDialog(context, user.uid, widget.id);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _getFilter(),
        builder: (BuildContext context, AsyncSnapshot<Filter> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.number);
            return Container(
                child: _View(
                    snapshot.data.name,
                    snapshot.data.number,
                    snapshot.data.area,
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
    );
  }
}

class _View extends StatelessWidget {
  final String name;
  final String number;
  final String area;
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
    this.area,
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
    String datedisp = DateFormat.yMMMMd().format(DateTime.parse(date ?? ''));
    String expDate1 = DateFormat.yMMMMd().format(DateTime.parse(expDate ?? ''));
    return Scaffold(
      backgroundColor: Color(0xFFebebeb),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 00),
        child: Column(
          children: [
            //NAME
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                      )
                    ]),
                child: new ListTile(
                  leading: Container(
                      padding: EdgeInsets.only(top: 0),
                      child: const Icon(Icons.person)),
                  selected: true,
                  title: new TextFormField(
                    initialValue: '$name',
                    enabled: false,
                    decoration: new InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: -3, bottom: 7, left: -10),
                      labelText: "Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //PHONE
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                      )
                    ]),
                child: new ListTile(
                  leading: Container(
                      padding: EdgeInsets.only(top: 0),
                      child: const Icon(Icons.phone)),
                  selected: true,
                  title: new TextFormField(
                    enabled: false,
                    initialValue: '$number',
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: -3, bottom: 7, left: -10),
                      labelText: "Phone",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            //ADDRESS
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                      )
                    ]),
                child: new ListTile(
                  leading: Container(
                      padding: EdgeInsets.only(top: 0),
                      child: const Icon(Icons.location_on)),
                  selected: true,
                  title: new TextFormField(
                    enabled: false,
                    initialValue: '$area',
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 4,
                    decoration: new InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: -3, bottom: 7, left: -10),
                      labelText: "Area",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            //ADDRESS
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                      )
                    ]),
                child: new ListTile(
                  leading: Container(
                      padding: EdgeInsets.only(top: 0),
                      child: const Icon(Icons.home)),
                  selected: true,
                  title: new TextFormField(
                    enabled: false,
                    initialValue: '$address',
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 4,
                    decoration: new InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: -3, bottom: 7, left: -10),
                      labelText: "Address",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            //MODEL.
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                      )
                    ]),
                child: new ListTile(
                  selected: true,
                  leading: Container(
                      padding: EdgeInsets.only(top: 0),
                      child: const Icon(Icons.description)),
                  title: new TextFormField(
                    enabled: false,
                    initialValue: '$model',
                    keyboardType: TextInputType.multiline,
                    decoration: new InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: -3, bottom: 7, left: -10),
                      border: InputBorder.none,
                      labelText: "Filter Model",
                    ),
                  ),
                ),
              ),
            ),

            //DATE
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.today,
                              color: Colors.black,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                DateFormat('dd MMM yyyy')
                                    .format(DateTime.parse(date)),
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.today,
                              color: Colors.red,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0,
                                  left: 8.0,
                                  right: 13.0,
                                  bottom: 8.0),
                              child: Text(
                                DateFormat('dd MMM yyyy')
                                    .format(DateTime.parse(expDate)),
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 180,
                  height: 60,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(10.0)),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(10.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                            )
                          ]),
                      child: new ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        contentPadding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: -6),
                        leading: Text(
                          '   ₹',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                          ),
                        ),
                        title: new TextFormField(
                          initialValue: '$price',
                          validator: (value) =>
                              value.isEmpty ? 'Enter Total anount' : null,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: -3, bottom: 7, left: -10),
                            border: InputBorder.none,
                            labelText: "Total",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(children: [
                  Container(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Container(
                              width: 40,
                              height: 40,
                              child: GestureDetector(
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  // backgroundImage:
                                  //     AssetImage('lib/assets/icon/call.png'),
                                ),
                                onTap: () {
                                  launch("tel:$number");
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          child: GestureDetector(
                            child: CircleAvatar(
                              child: Container(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                  // backgroundImage:
                                  //     AssetImage('lib/assets/icon/message.png'),
                                ),
                              ),
                            ),
                            onTap: () {
                              sendSms(number, date, date);
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
                        Container(
                          width: 40,
                          height: 40,
                          child: GestureDetector(
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Container(
                                width: 40,
                                height: 40,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                      'lib/assets/icon/whatsapp.png'),
                                ),
                              ),
                            ),
                            onTap: () {
                              String pdate = DateFormat('dd/MM/yyy')
                                  .format(DateTime.parse(date ?? ''));
                              String pdate1 = DateFormat('dd/MM/yyy')
                                  .format(DateTime.parse(date ?? ''));
                              FlutterOpenWhatsapp.sendSingleMessage(
                                  "+91$number",
                                  "Your Water Purifier Filter replace date is $pdate\nLast filter replace date-\n$pdate1 \nEvery three month once filter change for long life machine\n By BK WATER SOLUTION\n KANNADASAN | 9994960228");
                              // "Your Water Purifier Filter replace date is $pdate\nLast filter replace date-\n$pdate1 \nEvery three month once filter change for long life machine\n By BK WATER SOLUTION\n KANNADASAN | 9994960228");
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
                      ],
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
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
      Navigator.pop(context);
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
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
