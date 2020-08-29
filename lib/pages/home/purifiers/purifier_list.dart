import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:filter/models/purifier.dart';

class PurifierList extends StatefulWidget {
  @override
  _PurifierListState createState() => _PurifierListState();
}

class _PurifierListState extends State<PurifierList> {
  @override
  Widget build(BuildContext context) {
     final purifiers = Provider.of<List<Purifier>>(context);
    purifiers.forEach((purifier) {
      print(purifier.name);
    });
    return Container();
  }
}
