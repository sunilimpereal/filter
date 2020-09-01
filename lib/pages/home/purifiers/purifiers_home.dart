import 'package:filter/pages/home/purifiers/purifier_form.dart';
import 'package:filter/pages/home/purifiers/purifier_tile.dart';
import 'package:filter/widgets/progress_buton.dart';
import 'package:flutter/material.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/auth.dart';

import 'package:filter/services/database.dart';
import 'package:provider/provider.dart';
import 'purifier_list.dart';

class PurifierHome extends StatefulWidget {
  @override
  _PurifierHomeState createState() => _PurifierHomeState();
}

class _PurifierHomeState extends State<PurifierHome> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<Purifier>>.value(
      value: DatabaseService(uid: user.uid).purifierList,
      child: Scaffold(
        backgroundColor: Color(0xFFFDFFFC),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 45, 129, 131),
          title: Text('Purifiers'),
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
