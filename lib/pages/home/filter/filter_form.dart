import 'package:filter/classes/dateremin.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:provider/provider.dart';

class FilterForm extends StatefulWidget {
  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  ButtonState stateTextWithIcon = ButtonState.idle;
  DateTime _selectedDate = DateTime.now();
  //Form contents
  String name = '';
  String number = '';
  String address = '';
  String model = '';
  String price = '';
  String date = '';
  String paid = '';
  String due = '';
  String expDate = '';
  String id = '';
  String img = '';

  @override
  Widget build(BuildContext context) {
    date = _selectedDate.toString();
    final user = Provider.of<User>(context);
    return new Scaffold(
      backgroundColor: Color(0xFFebebeb),
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
                    leading: const Icon(Icons.person),
                    selected: true,
                    title: new TextFormField(
                      validator: (value) => value.isEmpty ? 'Enter name' : null,
                      onChanged: (value) {
                        setState(() {
                          name = value.toLowerCase();
                        });
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
                    leading: const Icon(Icons.phone),
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
                    leading: const Icon(Icons.home),
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
                        hintText: "Address",
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
                    leading: const Icon(Icons.description),
                    title: new TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Enter Filter model' : null,
                      onChanged: (value) {
                        setState(() {
                          model = value;
                        });
                      },
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: "Filter Model",
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
                          leading: const Icon(
                            Icons.attach_money,
                            color: Colors.amber,
                          ),
                          title: new TextFormField(
                            validator: (value) =>
                                value.isEmpty ? 'Enter Total anount' : null,
                            onChanged: (value) {
                              setState(() {
                                price = value.toString();
                              });
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
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
                          leading: const Icon(
                            Icons.attach_money,
                            color: Colors.green,
                          ),
                          title: new TextFormField(
                            validator: (value) =>
                                value.isEmpty ? 'Enter paid' : null,
                            onChanged: (value) {
                              setState(() {
                                paid = value.toString();
                              });
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
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
                          leading: const Icon(
                            Icons.attach_money,
                            color: Colors.red,
                          ),
                          title: new TextFormField(
                            validator: (value) =>
                                value.isEmpty ? 'Enter Due' : null,
                            onChanged: (value) {
                              setState(() {
                                due = value.toString();
                              });
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
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
                          expDate = DateReminder(date: date).addthreeMonths();

                          dynamic result = await DatabaseService(uid: user.uid)
                              .createFilter(id, name, number, address, date,
                                  model, price, paid, due, expDate);
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
