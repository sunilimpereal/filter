import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/classes/sms.dart';
import 'package:filter/models/service.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/service/service_edit.dart';
import 'package:filter/pages/home/service/service_home.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceView extends StatefulWidget {
  final String id;
  ServiceView({this.id});
  @override
  _ServiceViewState createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
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
      appBar: AppBar(
        title: Text(
          'Service',
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
                      builder: (context) => ServiceEdit(
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
          future: _getsService(),
          builder: (BuildContext context, AsyncSnapshot<Service> snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: _View(
                snapshot.data.name,
                snapshot.data.number,
                snapshot.data.area,
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
  final String area;
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
    this.area,
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 0),
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
              //Area
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
                        child: const Icon(Icons.location_on)),
                    selected: true,
                    title: new TextFormField(
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
                        child: const Icon(Icons.description)),
                    selected: true,
                    title: new TextFormField(
                      initialValue: '$description',
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                      decoration: new InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: -3, bottom: 7, left: -10),
                        labelText: "Description",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              //Spare.
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
                        child: const Icon(Icons.add_box)),
                    title: new TextFormField(
                      initialValue: '$spare1',
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: -3, bottom: 7, left: -10),
                        border: InputBorder.none,
                        labelText: "Spare",
                      ),
                    ),
                  ),
                ),
              ),
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
                        child: const Icon(Icons.add_box)),
                    title: new TextFormField(
                      initialValue: '$spare2',
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: -3, bottom: 7, left: -10),
                        border: InputBorder.none,
                        labelText: 'Spare',
                      ),
                    ),
                  ),
                ),
              ),
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
                        child: const Icon(Icons.add_box)),
                    title: new TextFormField(
                      initialValue: '$spare3',
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: -3, bottom: 7, left: -10),
                        border: InputBorder.none,
                        labelText: "Spare",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(children: [
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
                                width: 30,
                                height: 30,
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
                              // "Your Water Purifier Filter replace date is $pdate\nLast filter replace date-\n$pdate1 \nEvery three month once filter change for long life machine\n By SMART AQUA PURIFIER\n BALACHANDAR | 9524989863");
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
              ]),
              SizedBox(
                height: 10,
              ),
              // Row(children: [
              //   Container(
              //     width: 180,
              //     height: 60,
              //     child: Container(
              //       padding: EdgeInsets.symmetric(horizontal: 10.0),
              //       decoration: BoxDecoration(
              //         borderRadius:
              //             const BorderRadius.all(const Radius.circular(10.0)),
              //       ),
              //       child: Container(
              //         padding: EdgeInsets.symmetric(vertical: 3),
              //         decoration: BoxDecoration(
              //             borderRadius:
              //                 BorderRadius.all(const Radius.circular(10.0)),
              //             color: Colors.white,
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.grey,
              //                 blurRadius: 10.0,
              //               )
              //             ]),
              //         child: new ListTile(
              //           dense: true,
              //           visualDensity:
              //               VisualDensity(horizontal: 0, vertical: -4),
              //           contentPadding:
              //               EdgeInsets.only(left: 0.0, right: 0.0, top: -6),
              //           leading: Text(
              //             '   ₹',
              //             style: TextStyle(
              //               fontSize: 25,
              //               color: Colors.redAccent,
              //             ),
              //           ),
              //           title: new TextFormField(
              //             initialValue: '$due',
              //             validator: (value) =>
              //                 value.isEmpty ? 'Enter Total anount' : null,
              //             keyboardType: TextInputType.number,
              //             decoration: new InputDecoration(
              //               contentPadding:
              //                   EdgeInsets.only(top: -3, bottom: 7, left: -10),
              //               border: InputBorder.none,
              //               labelText: "Due",
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ]),

              SizedBox(
                height: 20,
              ),
            ],
          ),
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
    child: Text("Continue"),
    onPressed: () {
      DatabaseService(uid: uid).deleteService(id);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ServiceHome()));
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
