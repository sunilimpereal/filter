import 'package:filter/models/filter.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/service.dart';
import 'package:filter/pages/home/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:filter/models/user.dart';
import 'package:filter/services/database.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchResultHome extends StatelessWidget {
  String name;
  SearchResultHome(this.name);
  @override
  Widget build(BuildContext context) {
    print(name);
    final user = Provider.of<User>(context);
    return StreamProvider<List<Filter>>.value(
      value: DatabaseService(uid: user.uid).filterList,
      child: StreamProvider<List<Purifier>>.value(
        value: DatabaseService(uid: user.uid).purifierList,
        child: StreamProvider<List<Service>>.value(
            value: DatabaseService(uid: user.uid).serviceList,
            child: Container(child: SearchResult(name: name))),
      ),
    );
  }
}
