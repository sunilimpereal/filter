import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/classes/dateremin.dart';
import 'package:filter/classes/sms.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/purifiers/purifier_edit.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:filter/services/database.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:photo_view/photo_view.dart';
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
      appBar: AppBar(
        title: Text(
          'Installation',
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
                      builder: (context) => PurifierEdit(
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
                      snapshot.data.area,
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
    );
  }
}

class _View extends StatelessWidget {
  final String name;
  final String number;
  final String area;
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
    this.area,
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
      backgroundColor: Color(0xFFebebeb),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 0, right: 10),
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
                          leading: Container(
                              padding: EdgeInsets.only(top: 0),
                              child: const Icon(Icons.person)),
                          selected: true,
                          title: new TextFormField(
                            initialValue: '$name',
                            enabled: false,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: -3, bottom: 7, left: -10),
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
                          leading: Container(
                              padding: EdgeInsets.only(top: 0),
                              child: const Icon(Icons.phone)),
                          selected: true,
                          title: new TextFormField(
                            enabled: false,
                            initialValue: '$number',
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: -3, bottom: 7, left: -10),
                              labelText: "Phone",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Area

                    //Area

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
                              contentPadding: EdgeInsets.only(
                                  top: -3, bottom: 7, left: -10),
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
                              contentPadding: EdgeInsets.only(
                                  top: -3, bottom: 7, left: -10),
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
                          selected: true,
                          leading: Container(
                              padding: EdgeInsets.only(top: 0),
                              child: const Icon(Icons.description)),
                          title: new TextFormField(
                            enabled: false,
                            initialValue: '$model',
                            keyboardType: TextInputType.multiline,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: -3, bottom: 7, left: -10),
                              border: InputBorder.none,
                              labelText: "Filter Model",
                            ),
                          ),
                        ),
                      ),
                    ),

                    //MEMBRANE
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
                          selected: true,
                          leading: Container(
                              padding: EdgeInsets.only(top: 0),
                              child: const Icon(Icons.layers)),
                          title: new TextFormField(
                            enabled: false,
                            initialValue: '$membrane',
                            keyboardType: TextInputType.multiline,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: -3, bottom: 7, left: -10),
                              labelText: "Membrane",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //PUMP
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
                          selected: true,
                          leading: Container(
                              padding: EdgeInsets.only(top: 0),
                              child: const Icon(Icons.battery_full)),
                          title: new TextFormField(
                            initialValue: '$pump',
                            keyboardType: TextInputType.multiline,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: -3, bottom: 7, left: -10),
                              labelText: "Pump",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 180,
                          height: 60,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0)),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(10.0)),
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
                                contentPadding: EdgeInsets.only(
                                    left: 0.0, right: 0.0, top: -6),
                                leading: Text(
                                  '   ₹',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.blue,
                                  ),
                                ),
                                title: new TextFormField(
                                  initialValue: '$price',
                                  validator: (value) => value.isEmpty
                                      ? 'Enter Total anount'
                                      : null,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: -3, bottom: 7, left: -10),
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
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
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
                                      // "Your Water Purifier Filter replace date is $pdate\nLast filter replace date-\n$pdate1 \nEvery three month once filter change for long life machine\n By SMART AQUA PURIFIER\n Balachandar | 9524989863");
                                      final snackBar = SnackBar(
                                        content: Text('Message Sent to $name'),
                                        action: SnackBarAction(
                                          label: '',
                                          onPressed: () {},
                                        ),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Container(
                          width: 180,
                          height: 60,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0)),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(10.0)),
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
                                contentPadding: EdgeInsets.only(
                                    left: 0.0, right: 0.0, top: -6),
                                leading: Text(
                                  '   ₹',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.green,
                                  ),
                                ),
                                title: new TextFormField(
                                  initialValue: '$paid',
                                  validator: (value) =>
                                      value.isEmpty ? 'Enter paid' : null,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: -3, bottom: 7, left: -10),
                                    border: InputBorder.none,
                                    labelText: "Paid",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 60,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0)),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(10.0)),
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
                                contentPadding: EdgeInsets.only(
                                    left: 0.0, right: 0.0, top: -6),
                                leading: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    child: Text(
                                      '   ₹ ',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Container(
                                  padding: const EdgeInsets.all(0.0),
                                  child: new TextFormField(
                                    initialValue: '$due',
                                    validator: (value) =>
                                        value.isEmpty ? 'Enter Due' : null,
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: -3, bottom: 7, left: -10),
                                        border: InputBorder.none,
                                        labelText: "Due",
                                        fillColor: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    new ListTile(
                      leading: const Icon(Icons.image),
                      title: const Text('Image'),
                      subtitle: const Text('Warranty image'),
                      onTap: () async {
                        String imgurl = getimageView().toString();
                        print('hi');
                        print(imgurl);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageView(name)));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getimageView() async {
    final FirebaseStorage _storage =
        FirebaseStorage(storageBucket: 'gs://filterservice-74ce0.appspot.com');
    print(name);
    final url = await _storage
        .ref()
        .child('warrenty')
        .child('$name.png')
        .getDownloadURL();
    print('url');
    print(url.toString());

    return url.toString();
  }

  Widget imageViewWidget(String imgurl) {
    return Scaffold(body: Container());
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

class ImageView extends StatefulWidget {
  String name;
  ImageView(this.name);
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  String imgurl = '';
  Future<ImageProvider> getimageView() async {
    final FirebaseStorage _storage =
        FirebaseStorage(storageBucket: 'gs://filterservice-74ce0.appspot.com');
    print(widget.name);
    final url = await _storage
        .ref()
        .child('warrenty')
        .child('${widget.name}.png')
        .getDownloadURL();
    print('url');

    print(url.toString());
    return NetworkImage(url.toString());
  }

  @override
  Widget build(BuildContext context) {
    getimageView();
    print('in img');
    print(imgurl);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Colors.black.withAlpha(255),
          title: Text(
            'Warrenty Image',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
            future: getimageView(),
            builder: (BuildContext context,
                AsyncSnapshot<ImageProvider<dynamic>> snapshot) {
              if (snapshot.hasData) {
                return PhotoView(
                  imageProvider: snapshot.data,
                );
              } else {
                return Center(
                  child: Loading(
                    indicator: BallSpinFadeLoaderIndicator(),
                    size: 100,
                    color: Colors.blue,
                  ),
                );
              }
            }));
  }
}
