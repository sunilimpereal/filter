import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/classes/dateremin.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:filter/services/database.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class PurifierView extends StatefulWidget {
  final String id;
  PurifierView({this.id});
  @override
  _PurifierViewState createState() => _PurifierViewState();
}

class _PurifierViewState extends State<PurifierView> {
  @override
  Widget build(BuildContext context) {
    Future<Purifier> _getPurifier() async {
      String id = widget.id;
      final user = Provider.of<User>(context);
      DocumentSnapshot purifiersnap = await DatabaseService(uid: user.uid)
          .purifierCollection
          .document(user.uid)
          .collection('PurifierList')
          .document(id)
          .get();
      Purifier purifier = DatabaseService().purifierFromSnapshot(purifiersnap);
      print(purifier);
      return purifier;
    }

    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Color(0xFF153243),
        backgroundColorEnd: Color(0xFF235470),
        title: Text('Installation'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            iconSize: 30.0,
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => PurifierForm()));
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEBEBEB), Color(0xFFC9C9C9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
          future: _getPurifier(),
          builder: (BuildContext context, AsyncSnapshot<Purifier> snapshot) {
            if (snapshot.hasData) {
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
                      snapshot.data.img));
            } else {
              return Center(
                child: Loading(
                    indicator: BallPulseIndicator(),
                    size: 100.0,
                    color: Colors.pink),
              );
            }
          },
        ),
      ),
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
  final String img;

  _View(
    this.name,
    this.number,
    this.address,
    this.model,
    this.price,
    this.paid,
    this.due,
    this.date,
    this.img,
  );
  @override
  Widget build(BuildContext context) {
    String datedisp = DateFormat.yMEd().format(DateTime.parse(date ?? ''));
    String nextDate = DateReminder(date: date).addthreeMonths();
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          //Date(s)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            height: 27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  datedisp,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          //  NAME
          SizedBox(height: 7),
          Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
              ),
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        blurRadius: 1.0,
                      )
                    ]),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              '$name',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Row(children: [
                            Padding(
                                padding: EdgeInsets.only(),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF3bceac),
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Icon(
                                    Icons.message,
                                    size: 25,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF55a630),
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Icon(
                                    Icons.call,
                                    size: 25,
                                  ),
                                )),
                          ])
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 4,
                              left: 10,
                            ),
                            child: Text(
                              number,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                              left: 10,
                              bottom: 10,
                              right: 10,
                            ),
                            child: Text(
                              address,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          // //NUMBER
          // SizedBox(height: 10),
          // Container(
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 2.0),
          //     decoration: BoxDecoration(
          //       borderRadius:
          //           const BorderRadius.all(const Radius.circular(10.0)),
          //     ),
          //     child: Container(
          //       padding: EdgeInsets.symmetric(vertical: 0),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.all(const Radius.circular(10.0)),
          //           // color: Color(0xFF35393c),
          //           color: Colors.white,
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.blue,
          //               blurRadius: 1.0,
          //             )
          //           ]),
          //       child: ListTile(
          //         leading: Icon(
          //           Icons.contact_phone,
          //           color: Colors.blue,
          //           size: 30,
          //         ),
          //         title: Text(
          //           number,
          //           style: TextStyle(fontSize: 15.0, color: Colors.black),
          //         ),
          //         trailing: Container(
          //             child: Icon(
          //           Icons.phone,
          //           color: Colors.green,
          //           size: 29,
          //         )),
          //       ),
          //     ),
          //   ),
          // ),

          // //Address

          // SizedBox(height: 10),
          // Container(
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 2.0),
          //     decoration: BoxDecoration(
          //       borderRadius:
          //           const BorderRadius.all(const Radius.circular(10.0)),
          //     ),
          //     child: Container(
          //       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.all(const Radius.circular(10.0)),
          //           color: Colors.white,
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.blue,
          //               blurRadius: 1.0,
          //             )
          //           ]),
          //       child: ListTile(
          //         leading: Icon(
          //           Icons.home,
          //           color: Color(0xFF72efdd),
          //           size: 35,
          //         ),
          //         visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          //         contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          //         title: Text(
          //           address,
          //           style: TextStyle(
          //             fontSize: 18.0,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

// MODEL

          SizedBox(height: 10),
          Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
              ),
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 1.0,
                        )
                      ]),
                  child: Row(children: [
                    Column(
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.only(),
                        //   child: Container(
                        //       height: 54,
                        //       width: 50,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(10.0),
                        //           color: Colors.blueGrey),
                        //       child: Icon(
                        //         Icons.build,
                        //         size: 35,
                        //       )),
                        // ),
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Container(
                              padding:
                                  EdgeInsets.only(top: 2, left: 3, bottom: 5),
                              child: Text(
                                'Model:',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ),
                        ]),

                        Padding(
                          padding: EdgeInsets.only(top: 1, left: 5, bottom: 10),
                          child: Container(
                            child: Text(
                              '  $model',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ])),
            ),
          ),

//COST

          SizedBox(height: 15),
          Row(children: [
            Container(
              height: 150,
              width: 300,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(10.0)),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 3.0,
                        )
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 13),
                            child: Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 70, top: 13, right: 10),
                            child: Text(
                              '₹ $price',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.purple[900]),
                            ),
                          ),
                        ],
                      ),

                      //paid
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 13, right: 10),
                            child: Text(
                              'Paid',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 50, top: 13, right: 10),
                            child: Text(
                              '₹ $paid',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[600]),
                            ),
                          ),
                        ],
                      ),

//Due
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 13, right: 10),
                            child: Text(
                              'Due',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: due == '0'
                                      ? Colors.green
                                      : Colors.redAccent),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 30, top: 13, right: 10),
                            child: Text(
                              '₹ $due',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: due == '0'
                                      ? Colors.green[600]
                                      : Colors.red[600]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),

          // Upcomin service date
          SizedBox(height: 10),
          Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
              ),
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 1.0,
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Icon(
                          Icons.notification_important,
                          size: 25,
                          color: Colors.red[500],
                        ),
                      ),
                      Container(
                        child: Text('Filter(exp) :'),
                      ),
                      Container(
                        child: Text(
                          nextDate,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
