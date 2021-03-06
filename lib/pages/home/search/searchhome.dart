import 'package:filter/models/filter.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/service.dart';
import 'package:filter/pages/home/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:provider/provider.dart';

class SearchHome extends StatefulWidget {
  @override
  _SearchHomeState createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<Filter>>.value(
      value: DatabaseService(uid: user.uid).filterList,
      child: StreamProvider<List<Purifier>>.value(
        value: DatabaseService(uid: user.uid).purifierList,
        child: StreamProvider<List<Service>>.value(
            value: DatabaseService(uid: user.uid).serviceList,
            child: SearchPage()),
      ),
    );
  }
}
