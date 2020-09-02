import 'package:filter/pages/home/purifiers/purifiers_home.dart';
import 'package:filter/pages/home/service/service_home.dart';
import 'package:filter/services/auth.dart';
import 'package:filter/widgets/spring_button.dart';
import 'package:flutter/material.dart';

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
        elevation: 0.0,
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
            height: 120.0,
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
                      filter(),
                      purchase(),
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
          Color(0xFFfcbf49),
        ),
        onTapDown: (_) => {
          Future.delayed(Duration(milliseconds: 150), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServiceHome()),
            );
          }),
        },
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
          Color(0xFF153243),
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
          Color(0xff577590),
        ),
        onTapDown: (_) => () {},
      ),
    );
  }

  Widget row(String text, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
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
