import 'package:filter/models/product.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/products/cartupdateview.dart';

import 'package:filter/widgets/spring_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductUpdate extends StatefulWidget {
  Product prod;
  ProductUpdate({this.prod});
  @override
  _ProductUpdateState createState() => _ProductUpdateState();
  int iu = 0;
}

class _ProductUpdateState extends State<ProductUpdate> {
  var selectedNumber;
  List<String> items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  List<String> itemList = [];
  int itemnum(List<String> list) {
    double len = (list.length) / 3;
    return len.round();
  }

  List<String> newitemList = [];
  int nu;
  @override
  Widget build(BuildContext context) {
    Product p = widget.prod;
    String des = p.description;
    String id = p.id;
    String date = p.date;
    String total = p.total;
    String paid = p.paid;
    String due = p.due;

    if (widget.iu == 0) {
      print('loop');
      itemList = [
        p.item1,
        p.q1,
        p.price1,
        p.item2,
        p.q2,
        p.price2,
        p.item3,
        p.q3,
        p.price3,
        p.item4,
        p.q4,
        p.price4,
        p.item5,
        p.q5,
        p.price5,
        p.item6,
        p.q6,
        p.price6,
        p.item7,
        p.q7,
        p.price7,
        p.item8,
        p.q8,
        p.price8,
        p.item9,
        p.q9,
        p.price9,
        p.item10,
        p.q10,
        p.price10,
        p.item11,
        p.q11,
        p.price11,
        p.item12,
        p.q12,
        p.price12,
        p.item13,
        p.q13,
        p.price13,
        p.item14,
        p.q14,
        p.price14,
        p.item15,
        p.q15,
        p.price15,
      ];

      for (var i = 0; i < itemList.length; i++) {
        if (itemList[i] != '') {
          newitemList.add(itemList[i]);
        }
      }
      setState(() {
        widget.iu = 1;
      });
    }
    final globalKey = GlobalKey<ScaffoldState>();
    int nu = itemnum(newitemList);

    final user = Provider.of<User>(context);
    return Scaffold(
      key: globalKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text(
                  'SYSTEMS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => systems(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text(
                  'SPARE PARTS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => spare(context)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(children: [
        SizedBox(height: 50),
        Container(
          padding: EdgeInsets.only(left: 30, right: 0),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 0, right: 0, left: 0),
                child: FloatingActionButton.extended(
                  label: Text(''),
                  heroTag: null,
                  icon: FaIcon(FontAwesomeIcons.arrowCircleLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 0, right: 0, left: 0),
                child: new FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: Colors.green,
                  icon: Icon(Icons.shopping_cart),
                  label: Text('Cart ($nu)'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartupdateView(
                                list: newitemList,
                                id: id,
                                des: des,
                                date: date,
                                total: total,
                                paid: paid,
                                due: due,
                              )),
                    );
                    print(itemList);
                  },
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     SizedBox(
              //       width: 100,
              //     ),

              //   ],
              // ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: (MediaQuery.of(context).size.height - 98),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                customItem(context, '', '', '1')),
                      );
                      // Add your onPressed code here!
                    },
                    child: Icon(Icons.add),
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget spare(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spares'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('MEMBRANE'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => membrane(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('ANTISCALANT'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => antiscalant(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('CLAMP'),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('COVER'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cover(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('FILTER'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => filter(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('FLOAT'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => float(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('FLOW RESTRICTOR'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => flowRestrictor(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('HOUSING'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => housing(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('POWER SUPPLY'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => powerSupply(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('PRE FILTER SET'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => floa()),
                  // );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('PUMP'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Float()),
                  // );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('SOLINOID VALVE'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Float()),
                  // );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('UV'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Float()),
                  // );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('VALVE'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ()),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget systems(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Systems'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('2LPH'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lph2(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('12LPH'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lph12(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('25LPH'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lph25(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('40LPH'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lph40(context)),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('50LPH'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lph50(context)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lph2(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2 Litre'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('AQUA PARAL'),
                subtitle: Text('₹13,900'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'AQUA PARAL', '4750', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('AQUA PARAL added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('DOLPHIN'),
                subtitle: Text('₹3,900'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'DOLPHIN MINERALS', '3900', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('DOLPHIN MINERALS added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('DOLPHIN MINERALS'),
                subtitle: Text('₹3,750'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'DOLPHIN', '3750', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('DOLPHIN added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('ULTR SMART'),
                subtitle: Text('₹4,800'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'ULTR SMART', '4800', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('ULTR SMART added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lph12(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('12 LPH'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('SWAN(12LPH)'),
                subtitle: Text('₹13,900'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'SWAN(12LPH)', '13900', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('SWAN added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('TAGO'),
                subtitle: Text('₹11,500'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'TAGO', '11500', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('TAGO added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('PURE H20'),
                subtitle: Text('₹8,750'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'PURE H20', '8750', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('PURE H20 added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('PURE WATER'),
                subtitle: Text('₹8,750'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'PURE WATER', '8750', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('PURE WATER added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('M PURE'),
                subtitle: Text('₹14,999'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'M PURE', '14999', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('M PURE added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('I PURE'),
                subtitle: Text('₹12,000'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'I PURE', '12000', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('I PURE added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('ALIVE'),
                subtitle: Text('₹14,999'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'ALIVE', '14999', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('ALIVE added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('CLUO'),
                subtitle: Text('₹11,700'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'CULO', '11700', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('CULO added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('GLORY'),
                subtitle: Text('₹12,450'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'ALIVE', '12450', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('GLORY added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('GLANCE'),
                subtitle: Text('₹10,500'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'GLANCE', '10500', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('GLANCE added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('MINTO'),
                subtitle: Text('₹11,880'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'MINTO', '11880', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('MINTO added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('MISTY PURE  WHITE'),
                subtitle: Text('₹12,450'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'MISTY PURE WHITE', '12450', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('MISTY PURE WHITE added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('OVAL'),
                subtitle: Text('₹14,999'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'OVAL', '14999', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('OVAL added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('SWIFT'),
                subtitle: Text('₹1,700'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'SWIFT', '11700', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('SWIFT added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('WALL MOUNT'),
                subtitle: Text('₹11,900'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'WALL MOUNT', '11900', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('WALL MOUNT added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('AQUA DIGI'),
                subtitle: Text('₹14,999'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'AQUA DIGI', '14999', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('AQUA DIGI added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('HOOL 5G'),
                subtitle: Text('₹23,999'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'HOOL 5G', '23999', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('HOOL 5G added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('SWAN DIGITAL'),
                subtitle: Text('₹14,000'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'SWAN DIGITAL', '14000', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('WAVE KRYSTAL TRANSPARENT'),
                subtitle: Text('₹14,500'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'WAVE KRYSTAL TRANSPARENT', '14500', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('WAVE KOMBO RO+UV'),
                subtitle: Text('₹22,950'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'WAVE KOMBO RO UV', '14500', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('WAVE PRIME ALKALI'),
                subtitle: Text('₹15,300'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'WAVE PRIME (ALKALI)', '15300', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('WAVE 5G PRO'),
                subtitle: Text('₹22,950'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'WAVE 5G PRO', '22950', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('GENPURE OPTIMA'),
                subtitle: Text('₹12,000'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'GENPURE OPTIMA', '12000', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('WALL MOUNT WITH UNDERSINK'),
                subtitle: Text('₹11,900'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'WAVE PRIME', '11900', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('NO BACT'),
                subtitle: Text('₹13,900'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'NO BACT', '13900', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('ALPHA RO UV'),
                subtitle: Text('₹14,999'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'ALPHA RO UV', '14999', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('MISTY PURE-BLACK'),
                subtitle: Text('₹12,450'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'MISTY PURE -BLACK', '12450', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('TEKLEEN RO UV(PLASTIC)'),
                subtitle: Text('₹15,500'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'WAVE PRIME', '15500', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('TEKLEEN RO UV(WHITE)'),
                subtitle: Text('₹15,500'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'TEKLEEN RO UV(WHITE)', '15500', '1')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lph25(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('25 LPH'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('WHALE 25 LPH'),
                subtitle: Text('₹19,950'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'WHALE 25 LPH', '19950', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('SKID 25 LPH'),
                subtitle: Text('₹18,499'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'SKID 25 LPH', '18499', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('OPEN 25 LPH'),
                subtitle: Text('₹14,999'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'OPEN 25 LPH', '14999', '1')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lph40(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('40 LPH'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('WHALE-E CHEN 300 HEALTHY300'),
                subtitle: Text('₹24,750'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(context,
                            'WHALE-E CHEN 300 HEALTHY300', '24750', '1')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lph50(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('50 LPH'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('WHALE 50 LPH'),
                subtitle: Text('₹32,700'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'WHALE 50LPH', '32700', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('OPEN SS SKID 50 LPH'),
                subtitle: Text('₹29,400'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'OPEN SS SKID 50LPH', '29400', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('CLOSED MS SKID 50 LPH'),
                subtitle: Text('₹39,900'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'CLOSED MS SKID 50 LPH', '39900', '1')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget antiscalant(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ANISCALANT'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('ANTISCALANT BALLS'),
                subtitle: Text('₹200'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'ANTISCALANT BALLS', '200', '1')),
                  );

                  final snackBar = SnackBar(
                    content: Text('ANTISCALANT BALLS added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('ANTISCALANT SlIM'),
                subtitle: Text('₹300'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'ANTISCALANT SlIM', '300', '1')),
                  );
                  final snackBar = SnackBar(
                    content: Text('ANTISCALANT SLIM added to cart'),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget membrane(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEMBRANE'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('MEMBRELLA-ALPHA'),
                subtitle: Text('₹2,360'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'MEMBRELLA-ALPHA', '2360', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('MEMBRELLA-BETA-1812-80GPD'),
                subtitle: Text('₹2,360'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'MEMBRELLA-BETA-1812-80GPD', '2360', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('HEALTHY BW-1812-80GPD'),
                subtitle: Text('₹300'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'HEALTHY BW-1812-80GPD', '300', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                  title: Text('FILMTEC BW-812-75GPD'),
                  subtitle: Text('₹2800'),
                  trailing: Text(
                    'Add',
                    style: TextStyle(color: Colors.green),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => customItem(
                              context, 'FILMTEC BW-812-75GPD', '2800', '1')),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('VONTRON-1812-80'),
                subtitle: Text('₹1600'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'VONTRON-1812-80', '1600', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('CSM 100GPD'),
                subtitle: Text('₹2,200'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'CSM 100GPD', '2200', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('TFC-812-80GPD'),
                subtitle: Text('₹1750'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'TFC-812-80GPD', '1750', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('HEALTHY BW-302-300GPD'),
                subtitle: Text('₹4125'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'HEALTHY BW-302-300GPD', '4125', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('TAOTEC-812-75GPD'),
                subtitle: Text('₹2,050'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'TAOTEC-812-75GPD', '2050', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('HI-FLOW-1812-75G'),
                subtitle: Text('₹1600'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'HI-FLOW-1812-75G', '1600', '1')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cover(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVERS'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('SWAN,PURE H20'),
                subtitle: Text('₹150'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'SWAN,PURE H20', '150', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('WALL MOUNT COVER'),
                subtitle: Text('₹150'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'WALL MOUNT COVER', '150', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('BRIZO COVER'),
                subtitle: Text('₹200'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'BRIZO COVER', '200', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('50 LPH OPEN COVER'),
                subtitle: Text('₹300'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, '50 LPH OPEN COVER', '300', '1')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customItem(BuildContext context, String item, String price, String q) {
    final _formKey = GlobalKey<FormState>();
    final globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('ADD item'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
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
                    leading: const Icon(Icons.add_box),
                    selected: true,
                    title: new TextFormField(
                      initialValue: item,
                      validator: (value) => value.isEmpty ? 'Enter name' : null,
                      onChanged: (value) {
                        setState(() {
                          item = value.toLowerCase();
                        });
                      },
                      decoration: new InputDecoration(
                        hintText: "Item Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
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
                    leading: const Icon(Icons.payment),
                    selected: true,
                    title: new TextFormField(
                      initialValue: price,
                      validator: (value) => value.isEmpty ? 'Enter cost' : null,
                      onChanged: (value) {
                        setState(() {
                          price = value;
                        });
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: new InputDecoration(
                        hintText: "Price",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(10.0)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 120,
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
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Qty',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        selected: true,
                        title: new TextFormField(
                          initialValue: q,
                          validator: (value) =>
                              value.isEmpty ? 'Enter Qty' : null,
                          onChanged: (value) {
                            setState(() {
                              q = value.toLowerCase();
                            });
                          },
                          decoration: new InputDecoration(
                            hintText: "QTY",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Quantity
            // SizedBox(
            //   height: 10,
            // ),
            // DropdownButtonHideUnderline(
            //   child: new DropdownButton<String>(
            //     items: items.map((String val) {
            //       return new DropdownMenuItem<String>(
            //         value: val,
            //         child: new Text(val),
            //       );
            //     }).toList(),
            //     value: selectedNumber,
            //     hint: Text(q),
            //     onChanged: (newValue) {
            //       setState(() {
            //         selectedNumber = newValue;
            //         q = selectedNumber;
            //       });
            //     },
            //   ),
            // ),

            //Add button

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SpringButton(
                    SpringButtonType.OnlyScale,
                    Container(
                      padding: EdgeInsets.only(left: 28, top: 13),
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                      ),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onTap: () {
                      print(price);
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          nu = itemnum(newitemList);
                          newitemList.add(item);
                          newitemList.add(q);
                          newitemList.add(price);
                          print(newitemList);
                        });

                        Fluttertoast.showToast(
                            msg: "$item added to cart",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        final snackBar = SnackBar(
                          content: Text('$item added to cart'),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        globalKey.currentState.showSnackBar(snackBar);
                        Future.delayed(const Duration(milliseconds: 00), () {
                          print('hi');
                          Navigator.pop(
                            context,
                          );
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget filter(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FILTER'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('INLINE PRECARBON'),
              subtitle: Text('₹590'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          customItem(context, 'INLINE PRECARBON', '590', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('INLINE POST CARBON'),
              subtitle: Text('₹590'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(
                          context, 'INLINE POST CARBON', '590', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('INLINE SET MEMBARNE'),
              subtitle: Text('₹1,415'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(
                          context, 'INLINE SET MEMBARNE', '1415', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('MINERAL CARTRIDGE'),
              subtitle: Text('₹1,415'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(
                          context, 'MINERAL CARTRIDGE', '1415', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('PH BOOSTER MEMBRANEPH BOOSTER MEMBRANE'),
              subtitle: Text('₹1,415'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(
                          context, 'PH BOOSTER MEMBRANE', '1415', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('INLINE SET HERO'),
              subtitle: Text('₹1,300'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          customItem(context, 'INLINE SET HERO', '1300', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('SPUN 10 MEMBRELLA'),
              subtitle: Text('₹235'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          customItem(context, 'SPUN 10 MEMBRELLA', '235', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('UF'),
              subtitle: Text('₹370'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          customItem(context, 'UF', '370', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('WALLMOUNT POST CARBON'),
              subtitle: Text('₹460'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(
                          context, 'WALLMOUNT POST CARBON', '460', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('H2AAA COPPER FILTER'),
              subtitle: Text('₹2,500'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(
                          context, 'H2AAA COPPER FILTER', '2500', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('TASTEIMPROVER'),
              subtitle: Text('₹1,415'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          customItem(context, 'TASTEIMPROVER', '1415', '1')),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget float(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLOAT'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('MEMBRELLA FLOAT(Lower connection)'),
              subtitle: Text('₹295'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(context,
                          'MEMBRELLA FLOAT(Lower connection)', '295', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('FLOAT SIDE CONNECTION'),
              subtitle: Text('₹250'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(
                          context, 'FLOAT SIDE CONNECTION', '250', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('FLOAT LOWER CONNECTIONS'),
              subtitle: Text('₹250'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(
                          context, 'FLOAT LOWER CONNECTIONS', '250', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('MEMBRELLA FLOAT SIDE CONNECTION'),
              subtitle: Text('₹295'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(context,
                          'MEMBRELLA FLOAT SIDE CONNECTION', '295', '1')),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget flowRestrictor(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FLOW RESTRICTOR'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('MEMBRELLA FR -450'),
              subtitle: Text('₹235'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(context,
                          'MEMBRELLA FLOAT SIDE CONNECTION', '295', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('FR -350 ML KFL'),
              subtitle: Text('₹190'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          customItem(context, 'FR -350 ML KFL', '190', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('FR -450 ML KFL'),
              subtitle: Text('₹190'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          customItem(context, 'FR -450 ML KFL', '190', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('MEMBRELLA -550 ML KFL'),
              subtitle: Text('₹190'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(
                          context, 'MEMBRELLA -550 ML KFL', '190', '1')),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('FR-800'),
              subtitle: Text('₹190'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          customItem(context, 'FR-800', '190', '1')),
                );
              },
            ),
          ),
        ])));
  }

  Widget housing(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HOUSING'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('20\" FILTER HOUSING 1/2\"/3/4\" SLIM'),
              subtitle: Text('₹800'),
              trailing: Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => customItem(context,
                          '20\" FILTER HOUSING 1/2\"/3/4\" SLIM', '800', '1')),
                );
              },
            ),
          ),
        ])));
  }

  Widget powerSupply(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('POWER SUPPLY'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('MEMBERELLA SMPS 24V 1.5A'),
                subtitle: Text('₹885'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'MEMBERELLA SMPS 24V 1.5A', '885', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('SMPS 24V 5A'),
                subtitle: Text('₹1500'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'SMPS 24V 5A', '1500', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('ADAPTER 24V FCW'),
                subtitle: Text('₹600'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'ADAPTER 24V FCW', '600', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('ADAPTER  36 V FCW'),
                subtitle: Text('₹600'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'ADAPTER  36 V FCW', '600', '1')),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('ADAPTER 48V FCW'),
                subtitle: Text('₹1,150'),
                trailing: Text(
                  'Add',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(
                            context, 'ADAPTER 48V FCW', '1150', '1')),
                  );
                },
              ),
            ),
          ],
        )));
  }
}
