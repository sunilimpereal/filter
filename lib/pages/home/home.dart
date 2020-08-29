import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:filter/services/database.dart';
import 'package:provider/provider.dart';
import 'purifiers/purifier_list.dart';
import 'package:filter/models/purifier.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Purifier>>.value(
      value: DatabaseService().purifierlist,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: Center(
          child: PurifierList(),
        ),
      ),
    );
  }
}
