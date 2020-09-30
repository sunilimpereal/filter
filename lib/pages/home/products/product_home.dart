import 'package:filter/models/product.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/products/newOder.dart';
import 'package:filter/pages/home/products/oder_view.dart';
import 'package:filter/pages/home/products/productview.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProducthomeBloc extends StatefulWidget {
  @override
  _ProducthomeBlocState createState() => _ProducthomeBlocState();
}

class _ProducthomeBlocState extends State<ProducthomeBloc> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<Product>>.value(
        value: DatabaseService(uid: user.uid).productList,
        child: ProductHome());
  }
}

class ProductHome extends StatefulWidget {
  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final products = Provider.of<List<Product>>(context) ?? [];
    products.sort((a, b) => b.date.compareTo(a.date));
    print(products);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 35,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewOrder()));
                  }),
            )
          ],
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * (0.7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: new Color(0xFF153243)),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 350,
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange),
                      width: MediaQuery.of(context).size.width * (0.9),
                      height: 290,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "lib/assets/icon/purchasehome.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 30, right: 30),
                            child: GestureDetector(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.white),
                                child: Center(
                                    child: Text(
                                  'Create New Order',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange[400]),
                                )),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewOrder()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      color: Colors.transparent,
                      child: (() {
                        return ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              String date = DateFormat('dd/mm/yyyy').format(
                                  DateTime.parse(products[index].date ?? ''));
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 80,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              (0.94),
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 8.0,
                                                      left: 8.0,
                                                      bottom: 4.0,
                                                      right: 8.0,
                                                    ),
                                                    child: Text(
                                                        products[index]
                                                            .description,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 8.0,
                                                      left: 8.0,
                                                      bottom: 4.0,
                                                      right: 8.0,
                                                    ),
                                                    child: Text(
                                                        (() {
                                                          return DateFormat(
                                                                  'dd/MM/yyyy')
                                                              .format(DateTime
                                                                  .parse(products[
                                                                          index]
                                                                      .date));
                                                        }()),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                        products[index].contact,
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: (() {
                                                        if (products[index]
                                                                .due !=
                                                            '0') {
                                                          return Icon(
                                                            Icons.info,
                                                            color: Colors.red,
                                                          );
                                                        } else {
                                                          return SizedBox();
                                                        }
                                                      }())),
                                                ],
                                              ),
                                              //second ror
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ViewOderHome(
                                              prod: products[index])),
                                    );
                                  },
                                ),
                              );
                              // return ListTile(
                              //   title: ((){
                              //     return

                              //   }()),
                              //   // Text(
                              //   //   products[index].description,
                              //   //   style: TextStyle(fontWeight: FontWeight.bold),
                              //   // ),
                              //   trailing: (() {
                              //     if (products[index].due != '0') {
                              //       return Icon(
                              //         Icons.info,
                              //         color: Colors.red,
                              //       );
                              //     } else {
                              //       return SizedBox();
                              //     }
                              //   }()),
                              //   onTap: () {
                              //     // Navigator.push(
                              //     //   context,
                              //     //   MaterialPageRoute(
                              //     //       builder: (context) =>
                              //     //           cartItems(context, products[index], user)),
                              //     // );
                              //   },
                              // );
                            });
                      }())),
                ),
              ],
            ),
          ],
        ));
  }
}
