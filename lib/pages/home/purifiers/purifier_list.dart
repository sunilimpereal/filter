import 'package:flutter/material.dart';
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
    print(purifiers);
    purifiers.forEach((purifier) {
      print(purifier.name);
    });
    return Container();
  }
}
