import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<String> itemList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                print(itemList);

                DatabaseService().createProduct(
                    '',
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
                        return '';
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
                  MaterialPageRoute(builder: (context) => antiscalant(context)),
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
                  MaterialPageRoute(builder: (context) => Float()),
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
                  MaterialPageRoute(builder: (context) => FlowRestrictor()),
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
                  MaterialPageRoute(builder: (context) => Housing()),
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
                  MaterialPageRoute(builder: (context) => PowerSuply()),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Float()),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('PUMP'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Float()),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('SOLINOID VALVE'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Float()),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('UV'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Float()),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text('VALVE'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Float()),
                );
              },
            ),
          ),
        ],
      )),
    );
  }

  Widget antiscalant(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  itemList.add('ANTISCALANT BALLS');
                  itemList.add('200');
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
                  itemList.add('ANTISCALANT SLIM');
                  itemList.add('300');
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
      appBar: AppBar(),
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
                  itemList.add('MEMBRELLA-ALPHA');
                  itemList.add('2360');
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
                  itemList.add('MEMBRELLA-BETA-1812-80GPD');
                  itemList.add('2360');
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
                  itemList.add('HEALTHY BW-1812-80GPD');
                  itemList.add('300');
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
                  itemList.add('FILMTEC BW-812-75GPD');
                  itemList.add('2800');
                },
              ),
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
                  itemList.add('VONTRON-1812-80');
                  itemList.add('1600');
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
                  itemList.add('CSM 100GPD');
                  itemList.add('2200');
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
                  itemList.add('TFC-812-80GPD');
                  itemList.add('1750');
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
                  itemList.add('HEALTHY BW-302-300GPD');
                  itemList.add('4125');
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
                  itemList.add('TAOTEC-812-75GPD');
                  itemList.add('2050');
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
                  itemList.add('HI-FLOW-1812-75G');
                  itemList.add('1600');
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
      appBar: AppBar(),
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
                  itemList.add('SWAN,PURE H20');
                  itemList.add('150');
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
                  itemList.add('WALL MOUNT COVER');
                  itemList.add('150');
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
                  itemList.add('BRIZO COVER');
                  itemList.add('200');
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
                  itemList.add('50 LPH OPEN COVER');
                  itemList.add('300');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget filter(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: ListTile(
            title: Text('PH BOOSTER MEMBRANE'),
            subtitle: Text('₹1,415'),
            trailing: Text(
              'Add',
              style: TextStyle(color: Colors.green),
            ),
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
          ),
        ),
      ]),
    ),
  );
}

class Float extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
            ),
          ),
        ]),
      ),
    );
  }
}

class FlowRestrictor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
            ),
          ),
        ])));
  }
}

class Housing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
              onTap: () {},
            ),
          ),
        ])));
  }
}

class PowerSuply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
              ),
            ),
          ],
        )));
  }
}
