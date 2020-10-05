import 'dart:ui';

import 'package:filter/pages/home/account/account_home.dart';
import 'package:filter/pages/home/filter/filter_home.dart';
import 'package:filter/pages/home/products/cart.dart';
import 'package:filter/pages/home/products/product_home.dart';
import 'package:filter/pages/home/products/productview.dart';
import 'package:filter/pages/home/purifiers/purifiers_home.dart';
import 'package:filter/pages/home/reminder/rimender_home.dart';
import 'package:filter/pages/home/search/searchhome.dart';
import 'package:filter/pages/home/service/service_home.dart';
import 'package:filter/widgets/spring_button.dart';
import 'package:flutter/material.dart';
import 'package:filter/services/auth.dart';
import 'package:hexcolor/hexcolor.dart';

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
              image: AssetImage("lib/assets/img/home.png"), fit: BoxFit.cover),
        ),
      ),
      Column(
        children: [
          SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(255),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    offset: Offset(0, 0),
                    color: Colors.grey[300],
                  )
                ]),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SearchHome(),
                  _childPopup(),
                ]),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: horizonal(context),
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
            height: 50,
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
                color: Colors.white38.withAlpha(40),
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

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Color(0xFFD9BBF9).withAlpha(250),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      offset: Offset(1.2, 2.3))
                ]),
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: 50,
                height: 50,
                // color: Colors.black,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[]),
                child: Image(
                  image: AssetImage('lib/assets/icon/service.png'),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Container(
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[]),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFD9BBF9).withAlpha(250),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(20.0)),
                  ),
                  child: Center(
                    child: Text(
                      'Service',
                      style: TextStyle(
                        fontFamily: 'Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        // row("Service", Color(0xFFD9BBF9), 17.5, 'lib/assets/icon/service.png'),
        onTapDown: (_) => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ServiceHome()),
          ),
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Color(0xff6A66A3).withAlpha(250),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      offset: Offset(1.2, 2.3))
                ]),
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: 50,
                height: 50,
                // color: Colors.black,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[]),
                child: Image(
                  image: AssetImage('lib/assets/icon/purifier.png'),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Container(
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[]),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff6A66A3).withAlpha(250),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(20.0)),
                  ),
                  child: Center(
                    child: Text(
                      'Customer Entry',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        // row("Customer Entry", Color(0xff6A66A3), 16.5,
        //     'lib/assets/icon/purifier.png'),
        onTapDown: (_) => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PurifierHome()),
          ),
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.blue[400].withAlpha(250),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      offset: Offset(1.2, 2.3))
                ]),
            child: Column(children: [
              SizedBox(
                height: 19,
              ),
              Container(
                width: 40,
                height: 40,
                // color: Colors.black,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[]),
                child: Image(
                  image: AssetImage('lib/assets/icon/purchase.png'),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[]),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[400].withAlpha(250),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(20.0)),
                  ),
                  child: Center(
                    child: Text(
                      'Purchase',
                      style: TextStyle(
                        fontFamily: 'Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),

        // row("Purchase", Color(0xffCCF5AC).withAlpha(250), 17.5,
        //     'lib/assets/icon/purchase.png'),
        onTapDown: (_) => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProducthomeBloc()),
          ),
        },
      ),
    );
  }

  Widget filter() {
    return Container(
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 120.0,
          width: 170.0,
          child: SpringButton(
            SpringButtonType.OnlyScale,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Hexcolor('7692FF').withAlpha(250),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 0.5,
                          offset: Offset(1.2, 2.3))
                    ]),
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    // color: Colors.black,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.transparent,
                        boxShadow: <BoxShadow>[]),
                    child: Image(
                      image: AssetImage('lib/assets/icon/filter.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.transparent,
                        boxShadow: <BoxShadow>[]),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Hexcolor('7692FF').withAlpha(250),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20.0)),
                      ),
                      child: Center(
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            fontFamily: 'Sans',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),

            // row("Filter", Hexcolor('7692FF'), 17.5,
            //     'lib/assets/icon/filter.png'),
            onTapDown: (_) => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterHome()),
              ),
            },
          ),
        ),
      ]),
    );
  }

  Widget row(String text, Color color, double a, String path) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 0.5,
                  offset: Offset(1.2, 2.3))
            ]),
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: 70,
            height: 60,
            // color: Colors.black,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.transparent,
                boxShadow: <BoxShadow>[]),
            child: Image(
              image: AssetImage(path),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.transparent,
                boxShadow: <BoxShadow>[]),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20.0)),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: a,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget horizonal(BuildContext context) {
    return Container(
      height: 95,
      width: 400,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),

      //items
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  reminder(),
                  SizedBox(
                    width: 16,
                  ),
                  callender(context),
                  SizedBox(
                    width: 16,
                  ),
                  report(),
                  SizedBox(width: 16),
                  cart(),
                ],
              ),
            ),
          ),
        ],
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
                  color: Colors.red[500].withAlpha(150),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 0.5,
                        offset: Offset(1.0, 2.0))
                  ]),
              child: CircleAvatar(
                backgroundColor: Colors.red[700],
                radius: 30,
                child: Image(
                  image: AssetImage('lib/assets/icon/notification.png'),
                  width: 30,
                  height: 30,
                  color: null,
                ),
              ),
            ),
            onTapDown: (_) => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReminderHome()),
                  ),
                }),
      ),
      Text(
        'Notification',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
                color: Colors.lightBlueAccent[400].withAlpha(150),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      offset: Offset(1.2, 2.3))
                ]),
            child: CircleAvatar(
              backgroundColor: Colors.lightBlueAccent[400],
              radius: 60,
              child: Image(
                image: AssetImage('lib/assets/icon/cart.png'),
                width: 30,
                height: 30,
                color: null,
              ),
            ),
          ),
          onTapDown: (_) => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartHome()),
            ),
          },
        ),
      ),
      Text(
        'Cart',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
              child: Image(
                image: AssetImage('lib/assets/icon/accounts.png'),
                width: 35,
                height: 35,
                color: null,
              ),
            ),
          ),
          onTapDown: (_) => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountHome()),
            ),
          },
        ),
      ),
      Text(
        ' Accounts',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      )
    ]);
  }

  Widget callender(BuildContext context) {
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
              child: Image(
                image: AssetImage('lib/assets/icon/callender.png'),
                width: 35,
                height: 35,
                color: null,
              ),
            ),
          ),
          onTapDown: (_) => {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().add(Duration(days: -370)),
              lastDate: DateTime.now().add(Duration(days: 370)),
            ),
          },
        ),
      ),
      Text(
        '  Calender',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      )
    ]);
  }

  Widget _childPopup() => PopupMenuButton<int>(
        icon: Icon(
          Icons.more_vert,
          size: 35,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text(
              "Logout",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
        ],
        onSelected: (value) {
          AuthService().signOut();
        },
        offset: Offset(0, 100),
      );
}
