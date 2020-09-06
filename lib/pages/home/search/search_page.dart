import 'package:filter/classes/searchclass.dart';
import 'package:filter/models/filter.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      GestureDetector(
        child: Container(
          height: 50,
          width: 320,
          margin: EdgeInsets.only(top: 10, left: 10),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.blue[100].withAlpha(50),
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Text(
                      "    Search",
                      style: TextStyle(
                        color: Colors.black.withAlpha(160),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                Icon(
                  Icons.search,
                  color: Colors.black.withAlpha(170),
                ),
              ]),
        ),
        onTap: () {
          List<String> names = getNames(context);
          showSearch(context: context, delegate: DataSearch(names));
        },
      ),
    ]));
  }

  List<String> getNames(BuildContext context) {
    final services = Provider.of<List<Service>>(context) ?? [];
    services.sort((a, b) => b.date.compareTo(a.date));
    List<String> servicename = [];
    for (var i = 0; i < services.length; i++) {
      servicename.add(services[i].name);
    }
    print(servicename);
    print(services);
    final purifiers = Provider.of<List<Purifier>>(context) ?? [];
    purifiers.sort((a, b) => b.date.compareTo(a.date));
    print(purifiers);
    List<String> purifiername = [];
    for (var i = 0; i < purifiers.length; i++) {
      purifiername.add(purifiers[i].name);
    }
    print(purifiername);
    final filters = Provider.of<List<Filter>>(context) ?? [];
    filters.sort((a, b) => b.date.compareTo(a.date));
    List<String> filtername = [];
    for (var i = 0; i < filters.length; i++) {
      filtername.add(filters[i].name);
    }
    print(filtername);
    print(filters);
    List<String> names = filtername + servicename + purifiername;
    return names;
  }
}
