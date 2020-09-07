import 'dart:ui';

import 'package:filter/pages/home/account/account_home.dart';
import 'package:filter/pages/home/filter/filter_home.dart';
import 'package:filter/pages/home/products/cart.dart';
import 'package:filter/pages/home/products/productview.dart';
import 'package:filter/pages/home/purifiers/purifiers_home.dart';
import 'package:filter/pages/home/reminder/rimender_home.dart';
import 'package:filter/pages/home/search/searchhome.dart';
import 'package:filter/pages/home/service/service_home.dart';
import 'package:filter/widgets/spring_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.transparent,
        //   title: Text(
        //     'Home',
        //     style: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        //   actions: [
        //     IconButton(s
        //       icon: Icon(Icons.exit_to_app),
        //       color: Colors.black,
        //       onPressed: () async {
        //         await _auth.signOut();
        //       },
        //     )
        //   ],
        // ),
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/img/home1.jpg"), fit: BoxFit.cover),
        ),
      ),
      Column(
        children: [
          SizedBox(height: 28),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(255),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Row(children: [
                  SearchHome(),
                  Container(
                    padding: EdgeInsets.only(top: 6, left: 1),
                    child: Icon(
                      Icons.more_vert,
                      size: 28,
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: horizonal(),
                ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     SearchHome(),
          //     Container(
          //       padding: EdgeInsets.only(top: 6, left: 1),
          //       child: Icon(
          //         Icons.more_vert,
          //         size: 28,
          //       ),
          //     )
          //   ],
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: EdgeInsets.all(10),
          //   child: horizonal(),
          // ),
          // SizedBox(
          //   height: 10.0,
          // ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(2),
            // child: ClipRect(
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(
            //       sigmaX: 10,
            //       sigmaY: 10,
            //     ),
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white38.withAlpha(230),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      installation(),
                      service(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filter(),
                      purchase(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // ),
          // ),
        ],
      ),
    ]));
  }

  Widget service() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 120.0,
      width: 170.0,
      child: SpringButton(
        SpringButtonType.OnlyScale,
        row(
          "Service",
          Color(0xFF49B6FF),
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
      padding: EdgeInsets.all(10),
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
      padding: EdgeInsets.all(10),
      height: 120.0,
      width: 170.0,
      child: SpringButton(
        SpringButtonType.OnlyScale,
        row(
          "Purchase",
          Color.fromARGB(200, 145, 12, 7),
        ),
        onTapDown: (_) => {
          Future.delayed(Duration(milliseconds: 150), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductView()),
            );
          }),
        },
      ),
    );
  }

  Widget filter() {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 120.0,
        width: 170.0,
        child: SpringButton(
          SpringButtonType.OnlyScale,
          row(
            "Filter",
            Color(0xff577590),
          ),
          onTapDown: (_) => {
            Future.delayed(Duration(milliseconds: 150), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterHome()),
              );
            }),
          },
        ),
      ),
    );
  }

  Widget row(String text, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: color.withAlpha(180),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 0.5,
                  offset: Offset(1.2, 2.3))
            ]),
        child: Container(
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: <BoxShadow>[]),
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
        ),
      ),
    );
  }

  Widget horizonal() {
    return Container(
      height: 92,
      width: 400,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),

      //items
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 25,
            ),
            reminder(),
            SizedBox(
              width: 13,
            ),
            callender(),
            SizedBox(
              width: 13,
            ),
            report(),
            SizedBox(width: 13),
            cart(),
          ],
        ),
      ),
    );
  }

  Widget reminder() {
    return Column(children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 60,
        width: 60,
        child: SpringButton(
          SpringButtonType.OnlyScale,
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Color.fromARGB(200, 145, 12, 7).withAlpha(150),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      offset: Offset(1.2, 2.3))
                ]),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(200, 145, 12, 7),
              radius: 30,
              child: Icon(
                Icons.notification_important,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          onTapDown: (_) => {
            Future.delayed(Duration(milliseconds: 150), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReminderHome()),
              );
            }),
          },
        ),
      ),
      Text(
        'Notification',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      )
    ]);
  }

  Widget cart() {
    return Column(children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 60,
        width: 60,
        child: SpringButton(
          SpringButtonType.OnlyScale,
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Color.fromARGB(200, 200, 150, 7).withAlpha(150),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      offset: Offset(1.2, 2.3))
                ]),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(200, 200, 150, 7),
              radius: 60,
              child: Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          onTapDown: (_) => {
            Future.delayed(Duration(milliseconds: 150), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartHome()),
              );
            }),
          },
        ),
      ),
      Text(
        'Cart',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      )
    ]);
  }

  Widget report() {
    return Column(children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 60,
        width: 60,
        child: SpringButton(
          SpringButtonType.OnlyScale,
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.green[500].withAlpha(150),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      offset: Offset(1.2, 2.3))
                ]),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 60,
              child: Icon(
                Ionicons.ios_analytics,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          onTapDown: (_) => {
            Future.delayed(Duration(milliseconds: 150), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountHome()),
              );
            }),
          },
        ),
      ),
      Text(
        'Accounts',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      )
    ]);
  }

  Widget callender() {
    return Column(children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 60,
        width: 60,
        child: SpringButton(
          SpringButtonType.OnlyScale,
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.blue[500].withAlpha(150),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      offset: Offset(1.2, 2.3))
                ]),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 60,
              child: Icon(
                Icons.insert_invitation,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          onTapDown: (_) => () {},
        ),
      ),
      Text(
        'Calender',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      )
    ]);
  }
}
