import 'dart:math';

import 'package:filter/models/purifier.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  //Form contents
  String name = '';
  String number = '';
  String address = '';
  String model = '';
  String price = '';
  String date = '';
  String paid = '';
  String due = '';
  String img = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('New Installation'),
          actions: <Widget>[
            new IconButton(icon: const Icon(Icons.save), onPressed: () {})
          ],
        ),
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
                        validator: (value) {
                          value.isEmpty ? 'Enter name' : null;
                        },
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
                            value.isEmpty ? 'Enter model' : null,
                        onChanged: (value) {
                          setState(() {
                            model = value;
                          });
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: "Model",
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
                      height: 70,
                      child: Container(
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
                            leading: const Icon(
                              Icons.attach_money,
                              color: Colors.amber,
                            ),
                            title: new TextFormField(
                              validator: (value) =>
                                  value.isEmpty ? 'Enter price' : null,
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
                                hintText: "Price",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 70,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0)),
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
                  title: const Text('Date'),
                  subtitle: const Text('February 20, 1980'),
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
                            dynamic result =
                                await DatabaseService(uid: user.uid)
                                    .createPurifer(name, number, address, model,
                                        price, date, paid, due, img);

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
        ));
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
            name, number, address, model, price, date, paid, due, img);
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
}
