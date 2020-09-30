import 'package:filter/pages/authenticate/register.dart';
import 'package:filter/services/auth.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        padding: EdgeInsets.only(top: 170),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/img/signup.png"),
            fit: BoxFit.fitWidth,
          ),
          // gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      // VerticalText(),
                      // TextLogin(),
                    ]),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 250,
                          ),
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
                                  color: Colors.white.withAlpha(80),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.transparent,
                                      blurRadius: 10.0,
                                    )
                                  ]),
                              child: new ListTile(
                                leading: const Icon(Icons.email),
                                selected: true,
                                title: new TextFormField(
                                  validator: (value) =>
                                      value.isEmpty ? 'Enter email' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                  decoration: new InputDecoration(
                                    labelText: "Email",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
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
                                  color: Colors.white.withAlpha(100),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.transparent,
                                      blurRadius: 10.0,
                                    )
                                  ]),
                              child: new ListTile(
                                leading: const Icon(Icons.lock),
                                selected: true,
                                title: new TextFormField(
                                  obscureText: true,
                                  validator: (value) =>
                                      value.isEmpty ? 'Enter Password' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                  decoration: new InputDecoration(
                                    labelText: "Password",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Input Password

                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       top: 20, left: 50, right: 50),
                          //   child: Container(
                          //     height: 60,
                          //     width: MediaQuery.of(context).size.width,
                          //     child: TextFormField(
                          //       style: TextStyle(
                          //         color: Colors.black,
                          //       ),
                          //       obscureText: true,
                          //       validator: (val) => val.length < 6
                          //           ? 'Enter 6 chracter password'
                          //           : null,
                          //       onChanged: (val) {
                          //         setState(() {
                          //           password = val;
                          //         });
                          //       },
                          //       decoration: InputDecoration(
                          //         border: InputBorder.none,
                          //         labelText: 'Password',
                          //         labelStyle: TextStyle(
                          //           color: Colors.black,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          //button for signin
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, right: 70, left: 70),
                            child: Container(
                              padding: EdgeInsets.only(),
                              alignment: Alignment.bottomRight,
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green[300],
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
                                color: Colors.greenAccent[700],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: FlatButton(
                                //on pressed function

                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    dynamic result =
                                        await _auth.signInWithEmailpassword(
                                            email, password);
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
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // Icon(
                                    //   Icons.arrow_forward,
                                    //   color: Colors.white,
                                    // ),
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
                                      color: Colors.black,
                                    ),
                                  ),
                                  FlatButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Register()));
                                    },
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
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
