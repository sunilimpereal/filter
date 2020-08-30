import 'package:filter/models/purifier.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/purifiers/purifiers_home.dart';
import 'package:filter/services/auth.dart';
import 'package:filter/widgets/spring_button.dart';
import 'package:flutter/material.dart';
import 'package:filter/services/database.dart';
import 'package:provider/provider.dart';
import 'purifiers/purifier_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: Colors.black,
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 20.0,
                      spreadRadius: 3.0,
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      installation(),
                      service(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      purchase(),
                      filter(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget service() {
    return Container(
      height: 120.0,
      width: 170.0,
      child: SpringButton(
        SpringButtonType.OnlyScale,
        row(
          "Service",
          Color.fromARGB(255, 131, 211, 212),
        ),
        onTapDown: (_) => () {},
      ),
    );
  }

  Widget installation() {
    return Container(
      height: 120.0,
      width: 170.0,
      child: SpringButton(
        SpringButtonType.OnlyScale,
        row(
          "Installation",
          Color.fromARGB(255, 45, 129, 131),
        ),
        onTapDown: (_) => {
          Future.delayed(Duration(milliseconds: 150), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PurifierHome()),
            );
          }),
        },
      ),
    );
  }

  Widget purchase() {
    return Container(
      height: 120.0,
      width: 170.0,
      child: SpringButton(
        SpringButtonType.OnlyScale,
        row(
          "Purchase",
          Color.fromARGB(200, 145, 12, 7),
        ),
        onTapDown: (_) => () {},
      ),
    );
  }

  Widget filter() {
    return Container(
      height: 120.0,
      width: 170.0,
      child: SpringButton(
        SpringButtonType.OnlyScale,
        row(
          "Filter",
          Color.fromARGB(200, 244, 129, 83),
        ),
        onTapDown: (_) => () {},
      ),
    );
  }

  Widget row(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(5.5),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.5,
            ),
          ),
        ),
      ),
    );
  }
}
