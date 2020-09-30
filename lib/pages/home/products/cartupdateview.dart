import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartupdateView extends StatefulWidget {
  List<String> list;
  String id;
  String des;
  String date;
  String total;
  String paid;
  String due;
  CartupdateView(
      {this.list,
      this.id,
      this.des,
      this.date,
      this.total,
      this.paid,
      this.due});
  @override
  _CartupdateViewState createState() => _CartupdateViewState();
}

class _CartupdateViewState extends State<CartupdateView> {
  String description = '';
  String total;
  String paid = '0';
  String due = '0';
  DateTime ndate = DateTime.now();
  String id;
  // String sum(List<String> list) {
  //   int sum = 0;
  //   for (var i = 0; i < list.length; i + 3) {
  //     var q = int.parse(list[i + 1]);
  //     var c = int.parse(list[i + 2]);
  //     sum = sum + (q * c);
  //   }
  //   return sum.toString();
  // }

  @override
  Widget build(BuildContext context) {
    if (description == '') {
      description = widget.des;
      total = widget.total;
      paid = widget.paid;
      due = widget.due;
      ndate = DateTime.parse(widget.date);
      id = widget.id;
    }
    final user = Provider.of<User>(context);
    List<String> itemlist = widget.list;
    total = sum1(itemlist);
    int sum = 0;
    // try {
    //   for (var i = 0; i < itemlist.length; i + 3) {
    //     var q = int.parse(itemlist[i + 1]);
    //     var c = int.parse(itemlist[i + 2]);
    //     sum = sum + (q * c);
    //   }
    // } catch (e) {
    //   // TODO
    // }
    // print('list in cart  $sum');
    print(itemlist);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          leading: IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                child: Row(
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
              ),
              (() {
                try {
                  if (itemlist[0] != '') {
                    String name = itemlist[0];
                    String qn = itemlist[1];
                    String price = itemlist[2];
                    return Column(children: [
                      ListTile(
                        title: Text(
                          '$name ($qn)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                  if (itemlist[33] != '') {
                    String name = itemlist[33];
                    String qn = itemlist[34];
                    String price = itemlist[35];
                    return Column(children: [
                      ListTile(
                        title: Text(
                          '$name ($qn)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '₹ $price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]);
                  }
                } catch (e) {
                  return SizedBox();
                }
              }()),
              SizedBox(
                height: 20,
              ),

              //Details

              (() {
                // int sum = 0;
                // for (var i = 0; i < itemlist.length; i + 3) {
                //   int qi = i + 1;
                //   int ci = i + 2;
                //   var q = int.parse(itemlist[qi]);
                //   var c = int.parse(itemlist[ci]);
                //   sum = sum + (q * c);
                // }
                // print(sum.toString());
                return Container(
                  child: Column(
                    children: [
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
                        title: TextFormField(
                          initialValue: description,
                          onChanged: (value) {
                            setState(() {
                              description = value.toString();
                            });
                          },
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Description',
                          ),
                        ),
                      ),
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
                                DateFormat.yMMMEd().format(ndate),
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
                          onPressed: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            DateTime _pickerDate = await _selectDate(ndate);
                            setState(() {
                              ndate = _pickerDate;

                              print(ndate);
                            });
                          },
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
                              title: TextFormField(
                                initialValue: total,
                                onChanged: (value) {
                                  setState(() {
                                    total = value.toString();
                                  });
                                },
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                decoration: InputDecoration(
                                  hintText: sum1(itemlist),
                                ),
                              ),
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
                              title: TextFormField(
                                initialValue: paid,
                                onChanged: (value) {
                                  setState(() {
                                    paid = value.toString();
                                  });
                                },
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                decoration: InputDecoration(
                                  hintText: 'Paid',
                                ),
                              ),
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
                              title: TextFormField(
                                initialValue: due,
                                onChanged: (value) {
                                  setState(() {
                                    due = value.toString();
                                  });
                                },
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                decoration: InputDecoration(
                                  hintText: 'Due',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          FlatButton(
                            child: Container(
                              width: 100,
                              height: 30,
                              color: Colors.green,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Save',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ]),
                            ),
                            onPressed: () {
                              DatabaseService(uid: user.uid).updateProduct(
                                id,
                                ndate.toString(),
                                description,
                                '',
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
                            },
                          )
                        ],
                      )
                    ],
                  ),
                );
              }())
            ],
          ),
        ));
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
}
