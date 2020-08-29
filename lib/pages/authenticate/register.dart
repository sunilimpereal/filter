import 'package:filter/pages/home/home.dart';
import 'package:filter/widgets/textnew.dart';
import 'package:filter/widgets/verticalregis.dart';
import 'package:flutter/material.dart';
import 'package:filter/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  SingUp(),
                  TextNew(),
                ]),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Input email
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 50, right: 50),
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.lightBlueAccent,
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.white70,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Input Password

                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 50, right: 50),
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'Enter 6 chracter password'
                                : null,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'New Password',
                              labelStyle: TextStyle(
                                color: Colors.white70,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //button for signin
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, right: 50, left: 200),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue[300],
                                blurRadius:
                                    10.0, // has the effect of softening the shadow
                                spreadRadius:
                                    1.0, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: FlatButton(
                            //on pressed function

                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result = await _auth
                                    .registerWithEmailpassword(email, password);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                                if (result == null) {
                                  setState(() {
                                    error = 'please supply valid detail';
                                  });
                                }
                              }
                            },

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.lightBlueAccent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 13.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
//end of button
                    ],
                  ),
                )
                // InputEmail(),
                // PasswordInput(),
                // ButtonLogin(),
                // FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
