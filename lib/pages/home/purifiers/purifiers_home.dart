import 'package:filter/pages/home/purifiers/purifier_form.dart';
import 'package:flutter/material.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'purifier_list.dart';

class PurifierHome extends StatefulWidget {
  @override
  _PurifierHomeState createState() => _PurifierHomeState();
}

class _PurifierHomeState extends State<PurifierHome> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<Purifier>>.value(
      value: DatabaseService(uid: user.uid).purifierList,
      child: Scaffold(
        backgroundColor: Color(0xFFe5e5e5),
        appBar: GradientAppBar(
          elevation: 0.0,
          backgroundColorStart: Color(0xFF153243),
          backgroundColorEnd: Color(0xFF153243),
          title: Text('Installation'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PurifierForm()));
              },
            )
          ],
        ),
        body: PurifierList(),
      ),
    );
  }
}
