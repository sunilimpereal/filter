import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/classes/dateremin.dart';
import 'package:filter/models/service.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/service/service_home.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class ServiceView extends StatefulWidget {
  final String id;
  ServiceView({this.id});
  @override
  _ServiceViewState createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  @override
  Widget build(BuildContext context) {
    Future<Service> _getsService() async {
      String id = widget.id;
      final user = Provider.of<User>(context);
      DocumentSnapshot servicesnap = await DatabaseService(uid: user.uid)
          .serviceCollection
          .document(user.uid)
          .collection('ServiceList')
          .document(id)
          .get();
      Service service = DatabaseService().serviceFromSnapshot(servicesnap);
      print(service.due);
      return (service);
    }

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: GradientAppBar(
        backgroundColorStart: Colors.blue[50],
        backgroundColorEnd: Colors.blue[100],
        elevation: 0.0,
        title: Text(
          'Service Detail',
          style: TextStyle(
            color: Color(0xFF153243),
          ),
        ),
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Color(0xFF153243),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServiceHome()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Color(0xFF153243),
            ),
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
          future: _getsService(),
          builder: (BuildContext context, AsyncSnapshot<Service> snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: _View(
                snapshot.data.name,
                snapshot.data.number,
                snapshot.data.address,
                snapshot.data.description,
                snapshot.data.spare1,
                snapshot.data.spare2,
                snapshot.data.spare3,
                snapshot.data.sparePrice1,
                snapshot.data.sparePrice2,
                snapshot.data.sparePrice3,
                snapshot.data.price,
                snapshot.data.paid,
                snapshot.data.due,
                snapshot.data.date,
              ));
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
  final String description;
  final String spare1;
  final String spare2;
  final String spare3;
  final String sparePrice1;
  final String sparePrice2;
  final String sparePrice3;
  final String price;
  final String paid;
  final String due;
  final String date;

  _View(
    this.name,
    this.number,
    this.address,
    this.description,
    this.spare1,
    this.spare2,
    this.spare3,
    this.sparePrice1,
    this.sparePrice2,
    this.sparePrice3,
    this.price,
    this.paid,
    this.due,
    this.date,
  );
  @override
  Widget build(BuildContext context) {
    String datedisp = DateFormat.yMEd().format(DateTime.parse(date ?? ''));
    String nextDate = DateReminder(date: date).addthreeMonths();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[50], Colors.blue[100]],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
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
                            child: Text(address,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                )),
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

// Description

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
                                '   Description:',
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
                              '  $description',
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

// Spare

          SizedBox(height: 15),
          Row(children: [
            Container(
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
                          blurRadius: 2.0,
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
                              '$spare1',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 70, top: 13, right: 10),
                            child: Text(
                              '₹ $sparePrice1',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),

                      //spare2
                      spare2 == ''
                          ? null
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, top: 13, right: 10),
                                  child: Text(
                                    '$spare2',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 50, top: 13, right: 10),
                                  child: Text(
                                    '₹ $sparePrice2',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),

//spare
                      spare1 == ''
                          ? null
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, top: 13, right: 10),
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: due == '0'
                                            ? Colors.green
                                            : Colors.redAccent),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 30, top: 13, right: 10),
                                  child: Text(
                                    '',
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

//COSR

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
        ],
      ),
    );
  }
}
