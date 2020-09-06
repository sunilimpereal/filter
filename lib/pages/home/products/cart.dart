import 'package:filter/models/product.dart';
import 'package:filter/models/user.dart';
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
        appBar: AppBar(),
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
              'Products Cart ( $date )',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
  // int r1 = int.parse(p.price1);
  // int r2 = int.parse(p.price2);
  // int r3 = int.parse(p.price3);
  // int r4 = int.parse(p.price4);
  // int r5 = int.parse(p.price5);
  // int r6 = int.parse(p.price6);
  // int r7 = int.parse(p.price7);
  // int r8 = int.parse(p.price8);
  // int r9 = int.parse(p.price9);
  // int r10 = int.parse(p.price10);
  // int r11 = int.parse(p.price11);
  // int r12 = int.parse(p.price12);
  // int r13 = int.parse(p.price13);
  // int r14 = int.parse(p.price14);
  // int r15 = int.parse(p.price15);
  return Scaffold(
    appBar: AppBar(
      title: Text('Purchase($date)'),
      actions: [
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
      child: Column(
        children: [
          (() {
            if (p.item1 != '') {
              print(p.price1);
              int r1 = int.parse(p.price1);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r1',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r2 = int.parse(p.price2);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r2',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r3 = int.parse(p.price3);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r3',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r4 = int.parse(p.price4);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item4,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r4',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r5 = int.parse(p.price5);

              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      ' ₹ $r5',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r6 = int.parse(p.price6);

              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item6,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r6',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r7 = int.parse(p.price7);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item7,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r7',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r8 = int.parse(p.price8);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item8,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r8',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r9 = int.parse(p.price9);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item9,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r9',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r10 = int.parse(p.price10);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item10,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r10',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r11 = int.parse(p.price11);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item11,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      ' ₹ $r11',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r12 = int.parse(p.price12);

              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item12,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r12',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r13 = int.parse(p.price13);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item13,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r13',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r14 = int.parse(p.price14);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item14,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '₹ $r14',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
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
              int r15 = int.parse(p.price15);
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      p.item15,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      ' ₹ $r15',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Divider(
                    color: Colors.grey,
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }())
        ],
      ),
    ),
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
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
