import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:provider/provider.dart';

class ServiceForm extends StatefulWidget {
  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final _formKey = GlobalKey<FormState>();
  ButtonState stateTextWithIcon = ButtonState.idle;
  DateTime _selectedDate = DateTime.now();
  //Form contents
  String name = '';
  String number = '';
  String area = '';
  String address = '';
  String description = '';
  String date = '';
  String price = '';
  String spare1 = '';
  String spare2 = '';
  String spare3 = '';
  String sparePrice1 = '0';
  String sparePrice2 = '0';
  String sparePrice3 = '0';
  String paid = '';
  String due = '0';
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
          title: Text('Service'),
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
                          name = value;
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
              //area
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
                        child: const Icon(Icons.location_on)),
                    selected: true,
                    title: new TextFormField(
                      validator: (value) => value.isEmpty ? 'Enter area' : null,
                      onChanged: (value) {
                        setState(() {
                          area = value;
                        });
                      },
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                      decoration: new InputDecoration(
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

              //Description
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
                        child: const Icon(Icons.description)),
                    title: new TextFormField(
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
                        labelText: "Discription",
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
                          title: new TextFormField(
                            // validator: (value) =>
                            //     value.isEmpty ? 'Enter Spare name' : null,
                            onChanged: (value) {
                              setState(() {
                                spare1 = value;
                              });
                            },
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              labelText: "Spare part",
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
                          title: new TextFormField(
                            // validator: (value) =>
                            //     value.isEmpty ? value = '0' : null,
                            onChanged: (value) {
                              setState(() {
                                sparePrice1 = value.toString();
                              });
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              labelText: "Cost",
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
                          title: new TextFormField(
                            // validator: (value) =>
                            //     value.isEmpty ? 'Enter Spare name' : null,
                            onChanged: (value) {
                              setState(() {
                                spare2 = value;
                              });
                            },
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              labelText: "Spare part",
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
                          title: new TextFormField(
                            // validator: (value) =>
                            //     value.isEmpty ? value = '0' : null,
                            onChanged: (value) {
                              setState(() {
                                sparePrice2 = value.toString();
                              });
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              labelText: "Cost",
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
                          title: new TextFormField(
                            // validator: (value) =>
                            //     value.isEmpty ? 'Enter Spare name' : null,
                            onChanged: (value) {
                              setState(() {
                                spare3 = value;
                              });
                            },
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              labelText: "Spare part",
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
                          title: new TextFormField(
                            // validator: (value) =>
                            //     value.isEmpty ? value = '0' : null,
                            onChanged: (value) {
                              setState(() {
                                sparePrice3 = value.toString();
                              });
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              labelText: "Cost",
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
                            '    ₹',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.green,
                            ),
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
                              labelText: "Price",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   width: 180,
                  //   height: 60,
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 10.0),
                  //     decoration: BoxDecoration(
                  //       borderRadius:
                  //           const BorderRadius.all(const Radius.circular(10.0)),
                  //     ),
                  //     child: Container(
                  //       padding: EdgeInsets.symmetric(vertical: 3),
                  //       decoration: BoxDecoration(
                  //           borderRadius:
                  //               BorderRadius.all(const Radius.circular(10.0)),
                  //           color: Colors.white,
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey,
                  //               blurRadius: 10.0,
                  //             )
                  //           ]),
                  //       child: new ListTile(
                  //         dense: true,
                  //         visualDensity:
                  //             VisualDensity(horizontal: 0, vertical: -4),
                  //         contentPadding:
                  //             EdgeInsets.only(left: 0.0, right: 0.0, top: -6),
                  //         leading: Text(
                  //           '    ₹',
                  //           style: TextStyle(
                  //             fontSize: 25,
                  //             color: Colors.red,
                  //           ),
                  //         ),
                  //         title: new TextFormField(
                  //           initialValue: '0',
                  //           validator: (value) =>
                  //               value.isEmpty ? 'Enter Total anount' : null,
                  //           onChanged: (value) {
                  //             setState(() {
                  //               due = value.toString();
                  //             });
                  //           },
                  //           keyboardType: TextInputType.number,
                  //           inputFormatters: [
                  //             WhitelistingTextInputFormatter.digitsOnly
                  //           ],
                  //           decoration: new InputDecoration(
                  //             border: InputBorder.none,
                  //             labelText: "Due",
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                              .createService(
                            id,
                            name,
                            number,
                            area,
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
                            '0',
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
              SizedBox(height: 30),
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
