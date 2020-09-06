import 'package:filter/models/user.dart';
import 'package:filter/pages/home/home.dart';
import 'package:filter/services/database.dart';
import 'package:filter/widgets/spring_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<String> itemList = [];
  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();

    final user = Provider.of<User>(context);
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 20),
              icon: Icon(
                Icons.save,
                size: 40,
              ),
              onPressed: () {
                print(itemList);
                String d = DateTime.now().toString();
                DatabaseService(uid: user.uid).createProduct(
                    '',
                    d,
                    (() {
                      try {
                        return itemList[0];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[1];
                      } catch (e) {
                        print('erro');
                        return '0';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[2];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[3];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[4];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[5];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[6];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[7];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[8];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[9];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[10];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[11];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[12];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[13];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[14];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[15];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[16];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[17];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[18];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[19];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[20];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[21];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[22];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[23];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[24];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[25];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[26];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[27];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[28];
                      } catch (e) {
                        return '';
                      }
                    }()),
                    (() {
                      try {
                        return itemList[29];
                      } catch (e) {
                        return '';
                      }
                    }()));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }),
        ],
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 600, bottom: 40.0, right: 10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => customItem(context, '', '')),
                  );
                  // Add your onPressed code here!
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.blue,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new FloatingActionButton.extended(
                heroTag: null,
                backgroundColor: Colors.green,
                icon: Icon(Icons.save),
                label: Text('Save'),
                onPressed: () {
                  print(itemList);
                  String d = DateTime.now().toString();
                  DatabaseService(uid: user.uid).createProduct(
                      '',
                      d,
                      (() {
                        try {
                          return itemList[0];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[1];
                        } catch (e) {
                          print('erro');
                          return '0';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[2];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[3];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[4];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[5];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[6];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[7];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[8];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[9];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[10];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[11];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[12];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[13];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[14];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[15];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[16];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[17];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[18];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[19];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[20];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[21];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[22];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[23];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[24];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[25];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[26];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[27];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[28];
                        } catch (e) {
                          return '';
                        }
                      }()),
                      (() {
                        try {
                          return itemList[29];
                        } catch (e) {
                          return '';
                        }
                      }()));
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ]),
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
                subtitle: Text('200'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'ANTISCALANT BALLS', '200')),
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
                subtitle: Text('300'),
                trailing: Text(
                  'ADD',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            customItem(context, 'ANTISCALANT SlIM', '300')),
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
                        builder: (context) =>
                            customItem(context, 'MEMBRELLA-ALPHA', '2360')),
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
                            context, 'MEMBRELLA-BETA-1812-80GPD', '2360')),
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
                            context, 'HEALTHY BW-1812-80GPD', '300')),
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
                              context, 'FILMTEC BW-812-75GPD', '2800')),
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
                        builder: (context) =>
                            customItem(context, 'VONTRON-1812-80', '1600')),
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
                            customItem(context, 'CSM 100GPD', '2200')),
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
                            customItem(context, 'TFC-812-80GPD', '1750')),
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
                            context, 'HEALTHY BW-302-300GPD', '4125')),
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
                        builder: (context) =>
                            customItem(context, 'TAOTEC-812-75GPD', '2050')),
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
                        builder: (context) =>
                            customItem(context, 'HI-FLOW-1812-75G', '1600')),
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
                            customItem(context, 'SWAN,PURE H20', '150')),
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
                        builder: (context) =>
                            customItem(context, 'WALL MOUNT COVER', '150')),
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
                            customItem(context, 'BRIZO COVER', '200')),
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
                        builder: (context) =>
                            customItem(context, '50 LPH OPEN COVER', '300')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customItem(BuildContext context, String item, String price) {
    final _formKey = GlobalKey<FormState>();
    final globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Create item'),
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
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                      ),
                      child: Text(
                        'ADD',
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
                        itemList.add(item);
                        itemList.add(price);
                        print(itemList);
                        Fluttertoast.showToast(
                            msg: "This is Center Short Toast",
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
                          customItem(context, 'INLINE PRECARBON', '590')),
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
                      builder: (context) =>
                          customItem(context, 'INLINE POST CARBON', '590')),
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
                      builder: (context) =>
                          customItem(context, 'INLINE SET MEMBARNE', '1415')),
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
                      builder: (context) =>
                          customItem(context, 'MINERAL CARTRIDGE', '1415')),
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
                      builder: (context) =>
                          customItem(context, 'PH BOOSTER MEMBRANE', '1415')),
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
                          customItem(context, 'INLINE SET HERO', '1300')),
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
                          customItem(context, 'SPUN 10 MEMBRELLA', '235')),
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
                      builder: (context) => customItem(context, 'UF', '370')),
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
                      builder: (context) =>
                          customItem(context, 'WALLMOUNT POST CARBON', '460')),
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
                      builder: (context) =>
                          customItem(context, 'H2AAA COPPER FILTER', '2500')),
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
                          customItem(context, 'TASTEIMPROVER', '1415')),
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
                      builder: (context) => customItem(
                          context, 'MEMBRELLA FLOAT(Lower connection)', '295')),
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
                      builder: (context) =>
                          customItem(context, 'FLOAT SIDE CONNECTION', '250')),
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
                          context, 'FLOAT LOWER CONNECTIONS', '250')),
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
                      builder: (context) => customItem(
                          context, 'MEMBRELLA FLOAT SIDE CONNECTION', '295')),
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
                      builder: (context) => customItem(
                          context, 'MEMBRELLA FLOAT SIDE CONNECTION', '295')),
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
                          customItem(context, 'FR -350 ML KFL', '190')),
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
                          customItem(context, 'FR -450 ML KFL', '190')),
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
                      builder: (context) =>
                          customItem(context, 'MEMBRELLA -550 ML KFL', '190')),
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
                          customItem(context, 'FR-800', '190')),
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
                          '20\" FILTER HOUSING 1/2\"/3/4\" SLIM', '800')),
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
                            context, 'MEMBERELLA SMPS 24V 1.5A', '885')),
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
                            customItem(context, 'SMPS 24V 5A', '1500')),
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
                            customItem(context, 'ADAPTER 24V FCW', '600')),
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
                        builder: (context) =>
                            customItem(context, 'ADAPTER  36 V FCW', '600')),
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
                        builder: (context) =>
                            customItem(context, 'ADAPTER 48V FCW', '1150')),
                  );
                },
              ),
            ),
          ],
        )));
  }
}
