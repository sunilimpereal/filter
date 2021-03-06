import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/classes/dateremin.dart';
import 'package:filter/models/filter.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:provider/provider.dart';

class FilterEdit extends StatefulWidget {
  final String id;
  FilterEdit({this.id});

  @override
  _FilterEditState createState() => _FilterEditState();
}

class _FilterEditState extends State<FilterEdit> {
  final _formKey = GlobalKey<FormState>();
  ButtonState stateTextWithIcon = ButtonState.idle;
  DateTime _selectedDate = DateTime.now();
  //Form contents
  String name;
  String number;
  String area;
  String address;
  String model;
  String price;
  String date;
  String paid;
  String due;
  String expDate;
  String img;
  String date1 = '';
  String fexpDate;
  String idNumber;

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Color(0xFFebebeb),
      appBar: GradientAppBar(
          elevation: 0.0,
          backgroundColorStart: Color(0xFF153243),
          backgroundColorEnd: Color(0xFF153243),
          title: Text('Filter Edit'),
          actions: []),
      body: FutureBuilder(
          future: _getFilter(),
          builder: (BuildContext context, AsyncSnapshot<Filter> snapshot) {
            if (snapshot.hasData) {
              String idNumber = snapshot.data.idNumber;
              String name = snapshot.data.name;
              String number = snapshot.data.number;
              String address = snapshot.data.address;
              String area = snapshot.data.area;
              String model = snapshot.data.model;
              String price = snapshot.data.price;
              String date = snapshot.data.date;
              String paid = snapshot.data.paid;
              String due = snapshot.data.due;
              String expDate = snapshot.data.expDate;
              if (fexpDate == null) {
                fexpDate = snapshot.data.expDate;
              }
              if (date1 == '') {
                date1 = snapshot.data.date;
              }

              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      //idNumber
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0)),
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
                                padding: EdgeInsets.only(top: 7),
                                child: const Icon(Icons.person)),
                            selected: true,
                            title: new TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: snapshot.data.idNumber,
                              validator: (value) =>
                                  value.isEmpty ? 'Enter ID' : null,
                              onChanged: (value) {
                                idNumber = value;
                                print(idNumber);
                              },
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: -3, bottom: 7, left: -10),
                                labelText: "ID",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // name
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0)),
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
                                padding: EdgeInsets.only(top: 7),
                                child: const Icon(Icons.person)),
                            selected: true,
                            title: new TextFormField(
                              initialValue: snapshot.data.name,
                              validator: (value) =>
                                  value.isEmpty ? 'Enter name' : null,
                              onChanged: (value) {
                                name = value;
                                print(name);
                              },
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
                      //phone
                      SizedBox(height: 10.0),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0)),
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
                                padding: EdgeInsets.only(top: 7),
                                child: const Icon(Icons.phone)),
                            selected: true,
                            title: new TextFormField(
                              initialValue: snapshot.data.number,
                              validator: (value) =>
                                  value.isEmpty ? 'Enter mobile number' : null,
                              onChanged: (value) {
                                number = value.toString();
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
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
                      //area
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0)),
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
                                padding: EdgeInsets.only(top: 7),
                                child: const Icon(Icons.location_on)),
                            selected: true,
                            title: new TextFormField(
                              initialValue: snapshot.data.area,
                              validator: (value) =>
                                  value.isEmpty ? 'Enter area' : null,
                              onChanged: (value) {
                                area = value;
                              },
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

                      //address
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0)),
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
                                padding: EdgeInsets.only(top: 7),
                                child: const Icon(Icons.home)),
                            selected: true,
                            title: new TextFormField(
                              initialValue: snapshot.data.address,
                              validator: (value) =>
                                  value.isEmpty ? 'Enter address' : null,
                              onChanged: (value) {
                                address = value;
                              },
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

                      //model
                      SizedBox(height: 10),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0)),
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
                                padding: EdgeInsets.only(top: 7),
                                child: const Icon(Icons.description)),
                            title: new TextFormField(
                              initialValue: snapshot.data.model,
                              validator: (value) =>
                                  value.isEmpty ? 'Enter Filter model' : null,
                              onChanged: (value) {
                                model = value;
                              },
                              keyboardType: TextInputType.multiline,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                labelText: "Filter Model",
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Price
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
                                  leading: Container(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Text(
                                      '    ₹',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  title: new TextFormField(
                                    initialValue: snapshot.data.price,
                                    validator: (value) => value.isEmpty
                                        ? 'Enter Total anount'
                                        : null,
                                    onChanged: (value) {
                                      price = value.toString();
                                      print(price);
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
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
                        ],
                      ),

                      SizedBox(height: 20),
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: 180,
                      //       height: 60,
                      //       child: Container(
                      //         padding: EdgeInsets.symmetric(horizontal: 10.0),
                      //         decoration: BoxDecoration(
                      //           borderRadius: const BorderRadius.all(
                      //               const Radius.circular(10.0)),
                      //         ),
                      //         child: Container(
                      //           padding: EdgeInsets.symmetric(vertical: 3),
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.all(
                      //                   const Radius.circular(10.0)),
                      //               color: Colors.white,
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                   color: Colors.grey,
                      //                   blurRadius: 10.0,
                      //                 )
                      //               ]),
                      //           child: new ListTile(
                      //             leading: const Icon(
                      //               Icons.attach_money,
                      //               color: Colors.green,
                      //             ),
                      //             title: new TextFormField(
                      //               initialValue: snapshot.data.paid,
                      //               validator: (value) =>
                      //                   value.isEmpty ? 'Enter paid' : null,
                      //               onChanged: (value) {
                      //                 paid = value.toString();
                      //               },
                      //               keyboardType: TextInputType.number,
                      //               inputFormatters: [
                      //                 WhitelistingTextInputFormatter.digitsOnly
                      //               ],
                      //               decoration: new InputDecoration(
                      //                 border: InputBorder.none,
                      //                 labelText: "Paid",
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       width: 180,
                      //       height: 60,
                      //       child: Container(
                      //         padding: EdgeInsets.symmetric(horizontal: 10.0),
                      //         decoration: BoxDecoration(
                      //           borderRadius: const BorderRadius.all(
                      //               const Radius.circular(10.0)),
                      //         ),
                      //         child: Container(
                      //           padding: EdgeInsets.symmetric(vertical: 0),
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.all(
                      //                   const Radius.circular(10.0)),
                      //               color: Colors.white,
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                   color: Colors.grey,
                      //                   blurRadius: 10.0,
                      //                 )
                      //               ]),
                      //           child: new ListTile(
                      //             leading: const Icon(
                      //               Icons.attach_money,
                      //               color: Colors.red,
                      //             ),
                      //             title: new TextFormField(
                      //               initialValue: snapshot.data.due,
                      //               validator: (value) =>
                      //                   value.isEmpty ? 'Enter Due' : null,
                      //               onChanged: (value) {
                      //                 due = value.toString();
                      //               },
                      //               keyboardType: TextInputType.number,
                      //               inputFormatters: [
                      //                 WhitelistingTextInputFormatter.digitsOnly
                      //               ],
                      //               decoration: new InputDecoration(
                      //                   border: InputBorder.none,
                      //                   labelText: "Due",
                      //                   fillColor: Colors.red),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      new ListTile(
                        leading: const Icon(Icons.today),
                        title: FlatButton(
                          padding: EdgeInsets.all(0.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                DateFormat.yMMMEd().format(_selectedDate),
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          onPressed: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            DateTime _pickerDate =
                                await _selectDate(_selectedDate);
                            setState(() {
                              _selectedDate = _pickerDate;
                              date = _selectedDate.toString();
                              date1 = date;
                              print(date1);
                            });
                          },
                        ),
                      ),
                      new ListTile(
                        leading: const Icon(
                          Icons.today,
                          color: Colors.red,
                        ),
                        title: FlatButton(
                          padding: EdgeInsets.all(0.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                DateFormat.yMMMEd()
                                    .format(DateTime.parse(fexpDate)),
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          onPressed: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            DateTime _pickerDate =
                                await _selectDate(DateTime.parse(fexpDate));
                            setState(() {
                              expDate = _pickerDate.toString();
                              fexpDate = expDate.toString();
                            });
                          },
                        ),
                      ),

                      new ListTile(
                        leading: const Icon(Icons.image),
                        title: const Text('Image'),
                        subtitle: const Text('Warranty image'),
                      ),
                      Container(
                        child: ProgressButton.icon(
                            iconedButtons: {
                              ButtonState.idle: IconedButton(
                                  text: "Save",
                                  icon: Icon(Icons.save, color: Colors.white),
                                  color: Colors.green),
                              ButtonState.loading: IconedButton(
                                  text: "Loading",
                                  color: Colors.deepPurple.shade700),
                              ButtonState.fail: IconedButton(
                                  text: "Failed",
                                  icon: Icon(Icons.cancel, color: Colors.white),
                                  color: Colors.red.shade300),
                              ButtonState.success: IconedButton(
                                  text: "Success",
                                  icon: Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                  ),
                                  color: Colors.green.shade400)
                            },
                            onPressed: () async {
                              if (stateTextWithIcon == ButtonState.idle) {
                                print(date1);
                                stateTextWithIcon = ButtonState.loading;
                                Future.delayed(Duration(seconds: 1), () {});
                                if (_formKey.currentState.validate()) {
                                  final user = Provider.of<User>(context);
                                  expDate =
                                      DateReminder(date: date).addthreeMonths();
                                  print(name);
                                  print(address);

                                  dynamic result =
                                      await DatabaseService(uid: user.uid)
                                          .updateFilter(
                                    idNumber,
                                    widget.id,
                                    name,
                                    number,
                                    area,
                                    address,
                                    model,
                                    date1,
                                    price,
                                    paid,
                                    due,
                                    fexpDate,
                                  );
                                  print(result);

                                  Future.delayed(Duration(seconds: 1), () {
                                    setState(() {
                                      stateTextWithIcon = result == null
                                          ? ButtonState.success
                                          : ButtonState.fail;
                                    });
                                  });
                                }
                              }
                              setState(() {
                                stateTextWithIcon = stateTextWithIcon;
                              });
                            },
                            state: stateTextWithIcon),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Loading(
                    indicator: BallPulseIndicator(),
                    size: 100.0,
                    color: Colors.blue),
              );
            }
          }),
    );
  }

//Date Picker
  Future<DateTime> _selectDate(DateTime selectedDate) async {
    DateTime _initialDate = selectedDate;

    final DateTime _pickedDate = await showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (_pickedDate != null) {
      selectedDate = DateTime(
          _pickedDate.year,
          _pickedDate.month,
          _pickedDate.day,
          _initialDate.hour,
          _initialDate.minute,
          _initialDate.second,
          _initialDate.millisecond,
          _initialDate.microsecond);
    }
    return selectedDate;
  }
}
