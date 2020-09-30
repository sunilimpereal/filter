import 'package:filter/models/product.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/products/productupdate.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartHome extends StatefulWidget {
  @override
  _CartHomeState createState() => _CartHomeState();
}

class _CartHomeState extends State<CartHome> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<Product>>.value(
      value: DatabaseService(uid: user.uid).productList,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Purchases'),
        ),
        body: Cart(),
      ),
    );
  }
}

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final products = Provider.of<List<Product>>(context) ?? [];
    products.sort((a, b) => b.date.compareTo(a.date));
    print(products);
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          String date = DateFormat('dd/MM/yyyy')
              .format(DateTime.parse(products[index].date ?? ''));
          return ListTile(
            title: Text(
              products[index].description,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: (() {
              if (products[index].due != '0') {
                return Icon(
                  Icons.info,
                  color: Colors.red,
                );
              } else {
                return SizedBox();
              }
            }()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        cartItems(context, products[index], user)),
              );
            },
          );
        });
  }
}

Widget cartItems(BuildContext context, Product p, User user) {
  String date = DateFormat('dd/MM/yyyy').format(DateTime.parse(p.date ?? ''));
  return Scaffold(
    appBar: AppBar(
      title: Text(p.description),
      actions: [
        IconButton(
          icon: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          iconSize: 30,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductUpdate(prod: p)),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          iconSize: 30,
          onPressed: () {
            showAlertDialog(context, user.uid, p.id);
          },
        ),
      ],
    ),
    body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Row(
            children: [
              Text(
                'Items',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          (() {
            if (p.item1 != '') {
              String item = p.item1;
              String q = p.q1;
              print(p.price1);
              int r1 = int.parse(p.price1);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r1',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item2 != '') {
              String item = p.item2;
              String q = p.q2;
              int r2 = int.parse(p.price2);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r2',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item3 != '') {
              String item = p.item3;
              String q = p.q3;
              int r3 = int.parse(p.price3);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r3',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item4 != '') {
              String item = p.item4;
              String q = p.q4;
              int r4 = int.parse(p.price4);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r4',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item5 != '') {
              String item = p.item5;
              String q = p.q5;
              int r5 = int.parse(p.price5);

              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      ' ₹ $r5',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item6 != '') {
              String item = p.item6;
              String q = p.q6;
              int r6 = int.parse(p.price6);

              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r6',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item7 != '') {
              String item = p.item7;
              String q = p.q7;
              int r7 = int.parse(p.price7);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r7',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item8 != '') {
              String item = p.item8;
              String q = p.q8;
              int r8 = int.parse(p.price8);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r8',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item9 != '') {
              String item = p.item9;
              String q = p.q9;
              int r9 = int.parse(p.price9);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r9',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item10 != '') {
              String item = p.item10;
              String q = p.q10;
              int r10 = int.parse(p.price10);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r10',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item11 != '') {
              String item = p.item11;
              String q = p.q11;
              int r11 = int.parse(p.price11);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      ' ₹ $r11',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item12 != '') {
              String item = p.item12;
              String q = p.q12;
              int r12 = int.parse(p.price12);

              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r12',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item13 != '') {
              String item = p.item13;
              String q = p.q13;
              int r13 = int.parse(p.price13);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r13',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item14 != '') {
              String item = p.item14;
              String q = p.q14;
              int r14 = int.parse(p.price14);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r14',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          (() {
            if (p.item15 != '') {
              String item = p.item15;
              String q = p.q15;
              int r15 = int.parse(p.price15);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '$item ($q)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      ' ₹ $r15',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }()),
          Container(
            child: Column(children: [
              Row(
                children: [
                  Text(
                    'Purchase Details',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Text('Des:',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.w700)),
                  title: Text(p.description ?? '')),
              new ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: const Icon(
                  Icons.today,
                  color: Colors.black,
                ),
                title: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        DateFormat.yMMMEd().format(DateTime.parse(p.date)),
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  onPressed: () async {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 200,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Text('Total:',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700)),
                      title: Text(p.total ?? ''),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 200,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Text('Paid:',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700)),
                      title: Text(p.paid),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 200,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Text('Due:',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700)),
                      title: Text(p.due ?? ''),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ]),
          )
        ])),
  );
}

showAlertDialog(BuildContext context, String uid, String id) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = FlatButton(
      child: Text(
        "Confirm",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        DatabaseService(uid: uid).deleteProduct(id);
        Navigator.pop(context);
        Navigator.pop(context);
      });
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirm Delete"),
    content: Text("Would you like to delete the task?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
