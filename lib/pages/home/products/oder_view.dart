import 'package:filter/models/product.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ViewOderHome extends StatefulWidget {
  Product prod;
  ViewOderHome({this.prod});
  @override
  _ViewOderHomeState createState() => _ViewOderHomeState();
  int iu = 0;
}

class _ViewOderHomeState extends State<ViewOderHome> {
  int nu;
  @override
  Widget build(BuildContext context) {
    Product p = widget.prod;
    String order = p.description;
    String contact = p.contact;
    String id = p.id;
    String date = p.date;
    print(date);
    String total = p.total;
    String paid = p.paid;
    String due = p.due;
    List<String> newitemList = [];
    List<String> itemList = [];
    int itemnum(List<String> list) {
      double len = (list.length) / 3;
      return len.round();
    }

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
    return Scaffold(
      body: ViewOrder(
        list: newitemList,
        id: id,
        order: order,
        contact: contact,
        date: date,
        total: total,
        paid: paid,
        due: due,
      ),
    );
  }
}

class ViewOrder extends StatefulWidget {
  List<String> list;
  String id;
  String order;
  String contact;
  String date;
  String total;
  String paid;
  String due;
  ViewOrder(
      {this.list,
      this.id,
      this.order,
      this.contact,
      this.date,
      this.total,
      this.paid,
      this.due});

  @override
  _ViewOrderState createState() => _ViewOrderState();
  int iu = 0;
}

class _ViewOrderState extends State<ViewOrder> {
  var selectedNumber;
  List<String> itemlist1 = [];
  int itemnum(List<String> list) {
    double len = (list.length) / 3;
    return len.round();
  }

  String order = '';
  String contact;
  String total;
  String paid = '0';
  String due = '0';
  DateTime ndate = DateTime.now();
  String id;
  DateTime date;
  int nu;
  List<String> itemlist = [];

  @override
  Widget build(BuildContext context) {
    if (order == '') {
      order = widget.order;
      contact = widget.contact;
      print(order);
      total = widget.total;
      paid = widget.paid;
      due = widget.due;
      ndate = DateTime.parse(widget.date);
      id = widget.id;
    }
    final user = Provider.of<User>(context);
    List<String> itemlist = widget.list;
    total = sum1(itemlist);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('View Order',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.black,
              ),
              iconSize: 35,
              onPressed: () {
                showAlertDialog(context, user.uid, id);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.check_circle),
                iconSize: 35,
                onPressed: () {
                  setState(() {
                    total = sum1(itemlist);
                  });
                  DatabaseService(uid: user.uid).updateProduct(
                    id,
                    ndate.toString(),
                    order,
                    contact,
                    total,
                    paid,
                    due,
                    (() {
                      try {
                        return itemlist[0];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[1];
                      } catch (e) {
                        print('erro');
                        return '0';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[2];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[3];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[4];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[5];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[6];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[7];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[8];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[9];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[10];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[11];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[12];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[13];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[14];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[15];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[16];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[17];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[18];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[19];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[20];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[21];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[22];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[23];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[24];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[25];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[26];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[27];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[28];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[29];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[30];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[31];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[32];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[33];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[34];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[35];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[36];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[37];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[38];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[39];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[40];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[41];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[42];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[43];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemlist[44];
                      } catch (e) {
                        return '';
                      }
                    }()),
                  );
                  Navigator.pop(context);
                }),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: order,
                onChanged: (value) {
                  setState(() {
                    order = value;
                    print('changed');
                    print(order);
                  });
                },
                decoration: new InputDecoration(
                    fillColor: Colors.red,
                    // focusedBorder:InputBorder(borderSide: bottom),
                    labelText: "Order",
                    hoverColor: Colors.black),
              ),
              TextFormField(
                initialValue: contact,
                onChanged: (value) {
                  setState(() {
                    contact = value;
                  });
                },
                decoration: new InputDecoration(
                    fillColor: Colors.red,
                    // focusedBorder:InputBorder(borderSide: bottom),
                    labelText: "Contact",
                    hoverColor: Colors.black),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Align(
                  alignment: Alignment(-8.2, 0),
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.today,
                          color: Colors.grey,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          DateFormat('dd MMM yyyy').format(ndate),
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime _pickerDate = await _selectDate(DateTime.now());
                      setState(() {
                        ndate = _pickerDate;

                        print(ndate);
                      });
                    },
                  ),
                ),
              ),
              Divider(
                thickness: 0.8,
              ),
              //Total
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    (() {
                      String sum = sum1(itemlist);
                      return '₹ $sum';
                    }()),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              //PAID DUE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    child: TextFormField(
                      initialValue: paid,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        setState(() {
                          paid = value;
                        });
                      },
                      decoration: new InputDecoration(
                          fillColor: Colors.red,
                          // focusedBorder:InputBorder(borderSide: bottom),
                          labelText: "Paid",
                          hoverColor: Colors.black),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: TextFormField(
                      initialValue: due,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        setState(() {
                          due = value;
                        });
                      },
                      decoration: new InputDecoration(
                          fillColor: Colors.red,
                          // focusedBorder:InputBorder(borderSide: bottom),
                          labelText: "Due",
                          hoverColor: Colors.black),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Items in Order',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800]),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => itemView()));
                    },
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: itemsList(itemlist),
                ),
              )
            ],
          )),
    );
  }

//itemlist
  Widget itemsList(List<String> itemlist) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Column(children: [
        (() {
          try {
            if (itemlist[0] != '') {
              String name = itemlist[0];
              String qn = itemlist[1];
              String price = itemlist[2];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name  ( $qn )',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[3] != '') {
              String name = itemlist[3];
              String qn = itemlist[4];
              String price = itemlist[5];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[6] != '') {
              String name = itemlist[6];
              String qn = itemlist[7];
              String price = itemlist[8];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[9] != '') {
              String name = itemlist[9];
              String qn = itemlist[10];
              String price = itemlist[11];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[12] != '') {
              String name = itemlist[12];
              String qn = itemlist[13];
              String price = itemlist[14];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[15] != '') {
              String name = itemlist[15];
              String qn = itemlist[16];
              String price = itemlist[17];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[18] != '') {
              String name = itemlist[18];
              String qn = itemlist[19];
              String price = itemlist[20];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[15] != '') {
              String name = itemlist[15];
              String qn = itemlist[16];
              String price = itemlist[17];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[18] != '') {
              String name = itemlist[18];
              String qn = itemlist[19];
              String price = itemlist[20];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[21] != '') {
              String name = itemlist[21];
              String qn = itemlist[22];
              String price = itemlist[23];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[24] != '') {
              String name = itemlist[24];
              String qn = itemlist[25];
              String price = itemlist[26];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[27] != '') {
              String name = itemlist[27];
              String qn = itemlist[28];
              String price = itemlist[29];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[30] != '') {
              String name = itemlist[30];
              String qn = itemlist[31];
              String price = itemlist[32];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[330] != '') {
              String name = itemlist[33];
              String qn = itemlist[34];
              String price = itemlist[35];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[36] != '') {
              String name = itemlist[36];
              String qn = itemlist[37];
              String price = itemlist[38];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[39] != '') {
              String name = itemlist[39];
              String qn = itemlist[40];
              String price = itemlist[41];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[42] != '') {
              String name = itemlist[42];
              String qn = itemlist[43];
              String price = itemlist[44];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[45] != '') {
              String name = itemlist[45];
              String qn = itemlist[46];
              String price = itemlist[47];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[48] != '') {
              String name = itemlist[48];
              String qn = itemlist[49];
              String price = itemlist[50];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[51] != '') {
              String name = itemlist[51];
              String qn = itemlist[52];
              String price = itemlist[53];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[54] != '') {
              String name = itemlist[54];
              String qn = itemlist[55];
              String price = itemlist[56];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
        (() {
          try {
            if (itemlist[57] != '') {
              String name = itemlist[57];
              String qn = itemlist[58];
              String price = itemlist[59];
              return Column(children: [
                ListTile(
                  title: Text(
                    '$name ($qn)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '₹ $price',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]);
            }
          } catch (e) {
            return SizedBox();
          }
        }()),
      ]),
    );
  }

  //View Items
  Widget itemView() {
    final globalKey = GlobalKey<ScaffoldState>();

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
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
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
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Spares',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Systems',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '2 Liter',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('AQUA PARAL'),
                subtitle: Text('₹4,750'),
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '12 LPH',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '25 LPH',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '40 LPH',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '50 LPH',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'ANTISCALANT',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'MEMBRAEN',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'COVERS',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
    int total = int.parse(price) * int.parse(q);
    final _formKey = GlobalKey<FormState>();
    final globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add Product',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 5.0),
            icon: Icon(Icons.check_circle, size: 40),
            onPressed: () {
              print(price);
              if (_formKey.currentState.validate()) {
                setState(() {
                  nu = itemnum(itemlist);
                });
                itemlist.add(item);
                itemlist.add(q);
                itemlist.add(price);
                print(itemlist);
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
                  Navigator.pop(
                    context,
                  );
                });
              }
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),

              //Item NAme
              TextFormField(
                initialValue: item,
                onChanged: (value) {
                  setState(() {
                    item = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: -5),
                  labelText: 'Product Name',
                ),
              ),

              SizedBox(
                height: 10,
              ),

              // PRICE

              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    child: TextFormField(
                      initialValue: price,
                      validator: (value) => value.isEmpty ? 'Enter cost' : null,
                      onChanged: (value) {
                        setState(() {
                          price = value;
                          total = int.parse(price) * int.parse(q);
                        });
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: -5),
                        labelText: "Unit Price",
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: TextFormField(
                      initialValue: q,
                      validator: (value) =>
                          value.isEmpty ? 'Enter quantity' : null,
                      onChanged: (value) {
                        setState(() {
                          print(total);
                          q = value;
                          total = int.parse(price) * int.parse(q);
                        });
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: -5),
                        labelText: "Quantity",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     Text(
              //       'Details',
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 18),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Number Of Units',
              //       style: TextStyle(color: Colors.black, fontSize: 16),
              //     ),
              //     Text(
              //       '$q',
              //       style: TextStyle(color: Colors.black, fontSize: 16),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Total Aount',
              //       style: TextStyle(color: Colors.black, fontSize: 16),
              //     ),
              //     Text(
              //       '$total',
              //       style: TextStyle(color: Colors.black, fontSize: 16),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget filter(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'FILTER',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'FLOAT',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'FLOW RESTRICTOR',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
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
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'HOUSING',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
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
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'POWER SUPPLY',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
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

  //Date Picker
  Future<DateTime> _selectDate(DateTime selectedDate) async {
    DateTime _initialDate = selectedDate;

    final DateTime _pickedDate = await showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (_pickedDate != null) {
      selectedDate = DateTime(
          _pickedDate.year,
          _pickedDate.month,
          _pickedDate.day,
          _initialDate.hour,
          _initialDate.minute,
          _initialDate.second,
          _initialDate.millisecond,
          _initialDate.microsecond);
    }
    return selectedDate;
  }

  String sum1(List<String> list) {
    int sum = 0;
    print(list.length);
    for (var i = 0; i < list.length; i = i + 3) {
      print(list[i + 1]);
      var q = int.parse(list[i + 1]);
      var c = int.parse(list[i + 2]);
      sum = sum + (q * c);
    }
    return sum.toString();
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
}
