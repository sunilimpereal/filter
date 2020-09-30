import 'dart:math';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/purifiers/ins_filterform.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:provider/provider.dart';

class PurifierForm extends StatefulWidget {
  @override
  _PurifierFormState createState() => _PurifierFormState();
}

class _PurifierFormState extends State<PurifierForm> {
  final _formKey = GlobalKey<FormState>();
  ButtonState stateTextWithIcon = ButtonState.idle;
  DateTime _selectedDate = DateTime.now();
  //Form contents
  String name = '';
  String number = '';
  String address = '';
  String model = '';
  String membrane = '';
  String pump = '';
  String price = '';
  String date = '';
  String paid = '';
  String due = '';
  String img = '';
  String id = '';

  @override
  Widget build(BuildContext context) {
    date = _selectedDate.toString();
    final user = Provider.of<User>(context);
    return new Scaffold(
      appBar: GradientAppBar(
          elevation: 0.0,
          backgroundColorStart: Color(0xFF153243),
          backgroundColorEnd: Color(0xFF153243),
          title: Text('Installation'),
          actions: []),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // name
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
                        padding: EdgeInsets.only(top: 7),
                        child: const Icon(Icons.person)),
                    selected: true,
                    title: new TextFormField(
                      validator: (value) => value.isEmpty ? 'Enter name' : null,
                      onChanged: (value) {
                        setState(() {
                          name = value.toLowerCase();
                        });
                      },
                      decoration: new InputDecoration(
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
                        padding: EdgeInsets.only(top: 7),
                        child: const Icon(Icons.phone)),
                    selected: true,
                    title: new TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Enter mobile number' : null,
                      onChanged: (value) {
                        setState(() {
                          number = value.toString();
                        });
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: new InputDecoration(
                        labelText: "Phone",
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
                        padding: EdgeInsets.only(top: 7),
                        child: const Icon(Icons.home)),
                    selected: true,
                    title: new TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Enter address' : null,
                      onChanged: (value) {
                        setState(() {
                          address = value;
                        });
                      },
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                      decoration: new InputDecoration(
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
                        padding: EdgeInsets.only(top: 5),
                        child: const Icon(Icons.description)),
                    title: new TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Enter model' : null,
                      onChanged: (value) {
                        setState(() {
                          model = value;
                        });
                      },
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        labelText: "Model",
                      ),
                    ),
                  ),
                ),
              ),

              //membrane
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
                        padding: EdgeInsets.only(top: 7),
                        child: const Icon(Icons.layers)),
                    title: new TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Enter membrane' : null,
                      onChanged: (value) {
                        setState(() {
                          membrane = value;
                        });
                      },
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        labelText: "Membrane",
                      ),
                    ),
                  ),
                ),
              ),
              //pump
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
                        padding: EdgeInsets.only(top: 6),
                        child: const Icon(Icons.battery_full)),
                    title: new TextFormField(
                      validator: (value) => value.isEmpty ? 'Enter pump' : null,
                      onChanged: (value) {
                        setState(() {
                          pump = value;
                        });
                      },
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        labelText: "Pump",
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
                            validator: (value) =>
                                value.isEmpty ? 'Enter Total anount' : null,
                            onChanged: (value) {
                              price = value.toString();
                              print(price);
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            decoration: new InputDecoration(
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
                              color: Colors.green,
                            ),
                          ),
                          title: new TextFormField(
                            validator: (value) =>
                                value.isEmpty ? 'Enter paid' : null,
                            onChanged: (value) {
                              paid = value.toString();
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            decoration: new InputDecoration(
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
                          leading: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              child: Text(
                                '    ₹',
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
                              validator: (value) =>
                                  value.isEmpty ? 'Enter Due' : null,
                              onChanged: (value) {
                                due = value.toString();
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              decoration: new InputDecoration(
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
                leading: const Icon(Icons.today),
                title: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        DateFormat.yMMMEd().format(_selectedDate),
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime _pickerDate = await _selectDate(_selectedDate);
                    setState(() {
                      _selectedDate = _pickerDate;
                      date = _selectedDate.toString();
                      print(date);
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
                          text: "Loading", color: Colors.deepPurple.shade700),
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
                        stateTextWithIcon = ButtonState.loading;
                        Future.delayed(Duration(seconds: 1), () {});
                        if (_formKey.currentState.validate()) {
                          dynamic result = await DatabaseService(uid: user.uid)
                              .createPurifer(id, name, number, address, model,
                                  membrane, pump, price, date, paid, due, img);
                          print(result);

                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              stateTextWithIcon = result == null
                                  ? ButtonState.success
                                  : ButtonState.fail;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InsFilterForm(
                                        name: name,
                                        number: number,
                                        address: address)));
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
      ),
    );
  }

  Widget progressBtn(User user) {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle: IconedButton(
          text: "Save",
          icon: Icon(Icons.save, color: Colors.white),
          color: Colors.green),
      ButtonState.loading:
          IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
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
    }, onPressed: onPressedprogressBtn, state: stateTextWithIcon);
  }

  void onPressedprogressBtn(User user) async {
    if (stateTextWithIcon == ButtonState.idle) {
      stateTextWithIcon = ButtonState.loading;
      if (_formKey.currentState.validate()) {
        dynamic result = await DatabaseService(uid: user.uid).createPurifer(
            name,
            number,
            address,
            model,
            membrane,
            pump,
            price,
            date,
            paid,
            due,
            id,
            img);
        print(result);
      }
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          stateTextWithIcon = Random.secure().nextBool()
              ? ButtonState.success
              : ButtonState.fail;
        });
      });
    }

    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
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
