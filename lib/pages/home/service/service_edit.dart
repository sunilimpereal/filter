import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/classes/dateremin.dart';
import 'package:filter/models/filter.dart';
import 'package:filter/models/service.dart';
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

class ServiceEdit extends StatefulWidget {
  final String id;
  ServiceEdit({this.id});

  @override
  _ServiceEditState createState() => _ServiceEditState();
}

class _ServiceEditState extends State<ServiceEdit> {
  final _formKey = GlobalKey<FormState>();
  ButtonState stateTextWithIcon = ButtonState.idle;
  DateTime _selectedDate = DateTime.now();
  //Form contents
  String name;
  String number;
  String address;
  String model;
  String price;
  String date;
  String paid;
  String due;
  String expDate;
  String img;

  @override
  Widget build(BuildContext context) {
    Future<Service> _getService() async {
      String id = widget.id;
      final user = Provider.of<User>(context);
      DocumentSnapshot servicesnap = await DatabaseService(uid: user.uid)
          .serviceCollection
          .document(user.uid)
          .collection('ServiceList')
          .document(id)
          .get();
      Service service = DatabaseService().serviceFromSnapshot(servicesnap);
      print(service);
      return service;
    }

    return Scaffold(
      appBar: GradientAppBar(
          elevation: 0.0,
          backgroundColorStart: Colors.blue[300],
          backgroundColorEnd: Colors.blue[250],
          title: Text('Service edit'),
          actions: []),
      body: FutureBuilder(
          future: _getService(),
          builder: (BuildContext context, AsyncSnapshot<Service> snapshot) {
            if (snapshot.hasData) {
              String name = snapshot.data.name;
              String number = snapshot.data.number;
              String address = snapshot.data.address;
              String description = snapshot.data.description;
              String spare1 = snapshot.data.spare1;
              String spare2 = snapshot.data.spare2;
              String spare3 = snapshot.data.spare3;
              String sparePrice1 = snapshot.data.sparePrice1;
              String sparePrice2 = snapshot.data.sparePrice2;
              String sparePrice3 = snapshot.data.sparePrice3;
              String price = snapshot.data.price;
              String date = snapshot.data.date;
              String paid = snapshot.data.paid;
              String due = snapshot.data.due;
              String img = '';

              return Container(
                decoration: BoxDecoration(color: Color(0xFFebebeb)),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
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
                              leading: const Icon(Icons.person),
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
                                  hintText: "Name",
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
                              leading: const Icon(Icons.phone),
                              selected: true,
                              title: new TextFormField(
                                initialValue: snapshot.data.number,
                                validator: (value) => value.isEmpty
                                    ? 'Enter mobile number'
                                    : null,
                                onChanged: (value) {
                                  number = value.toString();
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                                decoration: new InputDecoration(
                                  hintText: "Phone",
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
                              leading: const Icon(Icons.home),
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
                                  hintText: "Address",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //description
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
                              selected: true,
                              leading: const Icon(Icons.description),
                              title: new TextFormField(
                                initialValue: description,
                                validator: (value) =>
                                    value.isEmpty ? 'Enter description' : null,
                                onChanged: (value) {
                                  setState(() {
                                    description = value;
                                  });
                                },
                                keyboardType: TextInputType.multiline,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Discription",
                                ),
                              ),
                            ),
                          ),
                        ),

                        //spare 1
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 250,
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
                                    title: new TextFormField(
                                      initialValue: sparePrice1,
                                      // validator: (value) =>
                                      //     value.isEmpty ? 'Enter Spare name' : null,
                                      onChanged: (value) {
                                        setState(() {
                                          spare1 = value;
                                        });
                                      },
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Spare part",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 60,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 1.0),
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
                                    title: new TextFormField(
                                      initialValue: sparePrice1,
                                      // validator: (value) =>
                                      //     value.isEmpty ? value = '0' : null,
                                      onChanged: (value) {
                                        setState(() {
                                          sparePrice1 = value.toString();
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Cost",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        //spare 2

                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 250,
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
                                    title: new TextFormField(
                                      initialValue: spare2,
                                      // validator: (value) =>
                                      //     value.isEmpty ? 'Enter Spare name' : null,
                                      onChanged: (value) {
                                        setState(() {
                                          spare2 = value;
                                        });
                                      },
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Spare part",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 60,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 1.0),
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
                                    title: new TextFormField(
                                      initialValue: sparePrice2,
                                      // validator: (value) =>
                                      //     value.isEmpty ? value = '0' : null,
                                      onChanged: (value) {
                                        setState(() {
                                          sparePrice2 = value.toString();
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Cost",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        //service 3
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 250,
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
                                    title: new TextFormField(
                                      initialValue: spare3,
                                      // validator: (value) =>
                                      //     value.isEmpty ? 'Enter Spare name' : null,
                                      onChanged: (value) {
                                        setState(() {
                                          spare3 = value;
                                        });
                                      },
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Spare part",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 60,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 1.0),
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
                                    title: new TextFormField(
                                      initialValue: sparePrice3,
                                      // validator: (value) =>
                                      //     value.isEmpty ? value = '0' : null,
                                      onChanged: (value) {
                                        setState(() {
                                          sparePrice3 = value.toString();
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Cost",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                                    leading: const Icon(
                                      Icons.attach_money,
                                      color: Colors.amber,
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
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Total",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                                    leading: const Icon(
                                      Icons.attach_money,
                                      color: Colors.green,
                                    ),
                                    title: new TextFormField(
                                      initialValue: snapshot.data.paid,
                                      validator: (value) =>
                                          value.isEmpty ? 'Enter paid' : null,
                                      onChanged: (value) {
                                        paid = value.toString();
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Paid",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                                    leading: const Icon(
                                      Icons.attach_money,
                                      color: Colors.red,
                                    ),
                                    title: new TextFormField(
                                      initialValue: snapshot.data.due,
                                      validator: (value) =>
                                          value.isEmpty ? 'Enter Due' : null,
                                      onChanged: (value) {
                                        due = value.toString();
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Due",
                                          fillColor: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
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

                              _selectedDate = _pickerDate;
                              date = _selectedDate.toString();
                              print(date);
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
                                    icon:
                                        Icon(Icons.cancel, color: Colors.white),
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
                                  stateTextWithIcon = ButtonState.loading;
                                  Future.delayed(Duration(seconds: 1), () {});
                                  if (_formKey.currentState.validate()) {
                                    final user = Provider.of<User>(context);
                                    print(name);
                                    print(address);

                                    dynamic result =
                                        await DatabaseService(uid: user.uid)
                                            .updateService(
                                      widget.id,
                                      name,
                                      number,
                                      address,
                                      description,
                                      date,
                                      spare1,
                                      spare2,
                                      spare3,
                                      sparePrice1,
                                      sparePrice2,
                                      sparePrice3,
                                      price,
                                      paid,
                                      due,
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
                        )
                      ],
                    ),
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
