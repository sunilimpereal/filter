import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/classes/dateremin.dart';
import 'package:filter/classes/sms.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/purifiers/purifier_edit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:filter/services/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class PurifierView extends StatefulWidget {
  final String id;
  PurifierView({this.id});
  @override
  _PurifierViewState createState() => _PurifierViewState();
}

class _PurifierViewState extends State<PurifierView> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
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
                      snapshot.data.membrane,
                      snapshot.data.pump,
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
                      builder: (context) => PurifierEdit(
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
  final String membrane;
  final String pump;
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
    this.membrane,
    this.pump,
    this.price,
    this.paid,
    this.due,
    this.date,
    this.img,
  );
  @override
  Widget build(BuildContext context) {
    String datedisp = DateFormat.yMd().format(DateTime.parse(date ?? ''));
    String nDate = DateReminder(date: date).addthreeMonths();
    String nextDate = DateFormat.yMd().format(DateTime.parse(nDate));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 150, left: 20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Name : ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
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
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Phone : ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
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
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Address : ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
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
              height: 15,
            ),
            Divider(),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.view_module,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Model : ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    '  $model',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.layers,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Membrane : ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    '  $membrane',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.battery_full,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Pump : ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    '  $pump',
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
            Divider(),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Price  : ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
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
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Due   : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    '   ₹ $due',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Installation Date  : ',
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
              height: 30,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(children: [
        SizedBox(
          height: 60,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: FloatingActionButton.extended(
                  label: Text(''),
                  heroTag: null,
                  icon: FaIcon(FontAwesomeIcons.arrowCircleLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0, left: 290),
          child: FloatingActionButton.extended(
            icon: Icon(Icons.call),
            label: Text(''),
            onPressed: () {
              launch("tel:$number");
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 290),
          child: FloatingActionButton.extended(
            heroTag: null,
            icon: Icon(Icons.message),
            label: Text(''),
            onPressed: () {
              sendSms(number, nextDate, date);
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
          padding: EdgeInsets.only(top: 10, left: 290),
          child: FloatingActionButton.extended(
            heroTag: null,
            icon: FaIcon(FontAwesomeIcons.whatsapp),
            label: Text(''),
            onPressed: () {},
          ),
        ),
      ]),
    );

    //  Container(
    //   padding: EdgeInsets.all(10),
    //   child: Column(
    //     children: [
    //       //Date(s)
    //       Container(
    //         padding: EdgeInsets.symmetric(
    //           horizontal: 15,
    //         ),
    //         height: 27,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: [
    //             Text(
    //               datedisp,
    //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //             )
    //           ],
    //         ),
    //       ),

    //       //  NAME
    //       SizedBox(height: 7),
    //       Container(
    //         child: Container(
    //           padding: EdgeInsets.symmetric(horizontal: 2.0),
    //           decoration: BoxDecoration(
    //             borderRadius:
    //                 const BorderRadius.all(const Radius.circular(10.0)),
    //           ),
    //           child: Container(
    //             alignment: Alignment.topCenter,
    //             padding: EdgeInsets.symmetric(vertical: 0),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.all(const Radius.circular(10.0)),
    //                 color: Colors.white,
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.blue,
    //                     blurRadius: 1.0,
    //                   )
    //                 ]),
    //             child: Container(
    //               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //               child: Column(
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(left: 10, top: 10),
    //                         child: Text(
    //                           '$name',
    //                           style: TextStyle(
    //                               fontSize: 23, fontWeight: FontWeight.w900),
    //                         ),
    //                       ),
    //                       Row(children: [
    //                         Padding(
    //                           padding: EdgeInsets.only(),
    //                           child: Container(
    //                             height: 40,
    //                             width: 40,
    //                             decoration: BoxDecoration(
    //                                 color: Color(0xFF3bceac),
    //                                 borderRadius: BorderRadius.circular(50.0)),
    //                             child: IconButton(
    //                               icon: Icon(
    //                                 Icons.message,
    //                                 color: Colors.white,
    //                                 size: 25,
    //                               ),
    //                               onPressed: () {
    //                                 sendSms(number, '');
    //                                 final snackBar = SnackBar(
    //                                   content: Text('Message Sent to $name'),
    //                                   action: SnackBarAction(
    //                                     label: '',
    //                                     onPressed: () {
    //                                       // Some code to undo the change.
    //                                     },
    //                                   ),
    //                                 );
    //                                 Scaffold.of(context).showSnackBar(snackBar);
    //                               },
    //                             ),
    //                           ),
    //                         ),
    //                         Padding(
    //                           padding: EdgeInsets.only(left: 10),
    //                           child: Container(
    //                             height: 40,
    //                             width: 40,
    //                             decoration: BoxDecoration(
    //                                 color: Color(0xFF55a630),
    //                                 borderRadius: BorderRadius.circular(50.0)),
    //                             child: IconButton(
    //                               icon: Icon(
    //                                 Icons.call,
    //                                 color: Colors.white,
    //                                 size: 25,
    //                               ),
    //                               onPressed: () {
    //                                 launch("tel:$number");
    //                               },
    //                             ),
    //                           ),
    //                         ),
    //                       ])
    //                     ],
    //                   ),
    //                   Row(
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(
    //                           top: 4,
    //                           left: 10,
    //                         ),
    //                         child: Text(
    //                           number,
    //                           style: TextStyle(
    //                               fontSize: 18, fontWeight: FontWeight.w500),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(
    //                           top: 5,
    //                           left: 10,
    //                           bottom: 10,
    //                           right: 10,
    //                         ),
    //                         child: Text(
    //                           address,
    //                           style: TextStyle(
    //                               fontSize: 17, fontWeight: FontWeight.w400),
    //                         ),
    //                       ),
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),

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

//           SizedBox(height: 10),
//           Container(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 2.0),
//               decoration: BoxDecoration(
//                 borderRadius:
//                     const BorderRadius.all(const Radius.circular(10.0)),
//               ),
//               child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 0),
//                   decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.all(const Radius.circular(10.0)),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.blue,
//                           blurRadius: 1.0,
//                         )
//                       ]),
//                   child: Row(children: [
//                     Column(
//                       children: [
//                         // Padding(
//                         //   padding: EdgeInsets.only(),
//                         //   child: Container(
//                         //       height: 54,
//                         //       width: 50,
//                         //       decoration: BoxDecoration(
//                         //           borderRadius: BorderRadius.circular(10.0),
//                         //           color: Colors.blueGrey),
//                         //       child: Icon(
//                         //         Icons.build,
//                         //         size: 35,
//                         //       )),
//                         // ),
//                         Row(children: [
//                           Padding(
//                             padding: EdgeInsets.only(),
//                             child: Container(
//                               padding:
//                                   EdgeInsets.only(top: 2, left: 3, bottom: 5),
//                               child: Text(
//                                 'Model:',
//                                 style:
//                                     TextStyle(fontSize: 14, color: Colors.grey),
//                               ),
//                             ),
//                           ),
//                         ]),

//                         Padding(
//                           padding: EdgeInsets.only(top: 1, left: 5, bottom: 10),
//                           child: Container(
//                             child: Text(
//                               '  $model',
//                               style: TextStyle(
//                                   fontSize: 19, fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ])),
//             ),
//           ),

// //COST

//           SizedBox(height: 15),
//           Row(children: [
//             Container(
//               height: 150,
//               width: 300,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 3.0),
//                 decoration: BoxDecoration(
//                   borderRadius:
//                       const BorderRadius.all(const Radius.circular(10.0)),
//                 ),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//                   decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.all(const Radius.circular(10.0)),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.blue,
//                           blurRadius: 3.0,
//                         )
//                       ]),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(left: 20, top: 13),
//                             child: Text(
//                               'Price',
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w700),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(left: 70, top: 13, right: 10),
//                             child: Text(
//                               '₹ $price',
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.purple[900]),
//                             ),
//                           ),
//                         ],
//                       ),

//                       //paid
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(left: 20, top: 13, right: 10),
//                             child: Text(
//                               'Paid',
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.green),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(left: 50, top: 13, right: 10),
//                             child: Text(
//                               '₹ $paid',
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.green[600]),
//                             ),
//                           ),
//                         ],
//                       ),

// //Due
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(left: 20, top: 13, right: 10),
//                             child: Text(
//                               'Due',
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: due == '0'
//                                       ? Colors.green
//                                       : Colors.redAccent),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(left: 30, top: 13, right: 10),
//                             child: Text(
//                               '₹ $due',
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: due == '0'
//                                       ? Colors.green[600]
//                                       : Colors.red[600]),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ]),

//           // Upcomin service date
//           SizedBox(height: 10),
//           Container(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 2.0),
//               decoration: BoxDecoration(
//                 borderRadius:
//                     const BorderRadius.all(const Radius.circular(10.0)),
//               ),
//               child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 0),
//                   decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.all(const Radius.circular(10.0)),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.blue,
//                           blurRadius: 1.0,
//                         )
//                       ]),
//                   child: Row(
//                     children: [
//                       Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                         child: Icon(
//                           Icons.notification_important,
//                           size: 25,
//                           color: Colors.red[500],
//                         ),
//                       ),
//                       Container(
//                         child: Text('Filter(exp) :'),
//                       ),
//                       Container(
//                         child: Text(
//                           nextDate,
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w500),
//                         ),
//                       )
//                     ],
//                   )),
//             ),
//           ),
//         ],
//       ),
//     );
  }
}

showAlertDialog(BuildContext context, String uid, String id) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context, true);
    },
  );
  Widget continueButton = FlatButton(
    child: Text(
      "Confirm",
      style: TextStyle(
        color: Colors.red,
      ),
    ),
    onPressed: () {
      DatabaseService(uid: uid).deletePurifier(id);
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
