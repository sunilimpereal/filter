import 'package:filter/models/purifier.dart';
import 'package:filter/pages/home/purifiers/purifier_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurifierTile extends StatelessWidget {
  final Purifier purifier;
  PurifierTile({this.purifier});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PurifierView(
                        id: purifier.id,
                      )));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 5.0),
          child: Stack(
            children: [
              filterCard(purifier.date, purifier.name, purifier.model,
                  purifier.number, purifier.price, purifier.due, purifier.id),
              filterThumbnail,
            ],
          ),
        ),
      ),
    );
  }

  final filterThumbnail = new Container(
    height: 100,
    width: 85,
    margin: new EdgeInsets.symmetric(vertical: 16.0),
    decoration: new BoxDecoration(
      color: const Color(0x00796b),
      image: new DecorationImage(
        image: new AssetImage('lib/assets/img/purifier.png'),
        fit: BoxFit.cover,
      ),
      borderRadius: new BorderRadius.all(new Radius.circular(55.0)),
      border: new Border.all(
        color: Color(0xFF102542),
        width: 3.0,
      ),
    ),
  );

  //Building filter card
  filterCard(String date, String name, String model, String number,
      String price, String due, String id) {
    print(DateTime.now().toString());
    print(date);
    print(name);
    date = DateFormat.Md().format(DateTime.parse(date ?? ''));
    return Container(
      height: 124.0,
      width: double.infinity,
      margin: new EdgeInsets.only(left: 40.0),
      decoration: new BoxDecoration(
          color: new Color(0xFF153243),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black12,
                blurRadius: 100.0,
                offset: new Offset(0.0, 10.0))
          ]),
      child: Container(
        padding: EdgeInsets.only(left: 46.0),
        child: Row(
          children: [
            Container(
              width: 240,
              height: 100,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 7.0, bottom: 7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        Text(
                          date ?? '',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text(
                          'New Installation  |',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(children: [
                        Text(
                          'Model : $model',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ])),
                  Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price : $price',
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              due != '0' ? 'Due : $due' : '',
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.red[300],
                              ),
                            ),
                          ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
