import 'package:filter/pages/authenticate/register.dart';
import 'package:filter/services/auth.dart';
import 'package:filter/widgets/textLogin.dart';
import 'package:filter/widgets/verticalText.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = '';
  String password = '';
  String error = '';

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
                  VerticalText(),
                  TextLogin(),
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
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.white70,
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
                                    .signInWithEmailpassword(email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'coud not sign in';
                                  });
                                }
                              }
                            },

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Sign in',
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

//end of button

                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Container(
                          alignment: Alignment.topRight,
                          //color: Colors.red,
                          height: 20,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Your first time?',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: Text(
                                  'Sing up',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 13.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
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

// class SignIn extends StatefulWidget {
//   @override
//   _SignInState createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[400],
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
//         child: Form(
//           child: Column(
//             chi
//           )
//         )
//       ),
//     );
//   }
// }
