import 'package:filter/models/filter.dart';
import 'package:filter/models/purifier.dart';
import 'package:filter/models/service.dart';
import 'package:filter/pages/home/filter/filter_tile.dart';
import 'package:filter/pages/home/purifiers/purifiertile.dart';
import 'package:filter/pages/home/service/servicetile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  String name;
  SearchResult({this.name});
  @override
  Widget build(BuildContext context) {
    final services = Provider.of<List<Service>>(context) ?? [];
    services.sort((a, b) => b.date.compareTo(a.date));
    List<Service> servicename = [];
    for (var i = 0; i < services.length; i++) {
      if (name == services[i].name) {
        servicename.add(services[i]);
      }
    }
    print(servicename);
    print(services);
    final purifiers = Provider.of<List<Purifier>>(context) ?? [];
    purifiers.sort((a, b) => b.date.compareTo(a.date));
    print(purifiers);
    List<Purifier> purifiername = [];
    for (var i = 0; i < purifiers.length; i++) {
      if (name == purifiers[i].name) {
        purifiername.add(purifiers[i]);
      }
    }
    print(purifiername);
    final filters = Provider.of<List<Filter>>(context) ?? [];
    filters.sort((a, b) => b.date.compareTo(a.date));
    List<Filter> filtername = [];
    for (var i = 0; i < filters.length; i++) {
      if (name == filters[i].name) {
        filtername.add(filters[i]);
      }
    }
    print(filtername);
    print(filters);

    return Column(
      children: [
        (() {
          if (filtername.length > 0) {
            for (var i = 0; i < (filtername.length); i++) {
              return FilterTile(
                filter: filtername[i],
              );
            }
          } else {
            return SizedBox(height: 0);
          }
        }()),
        (() {
          if (servicename.length > 0) {
            for (var i = 0; i < (servicename.length); i++) {
              return ServiceTile(
                    service: servicename[i],
                  ) ??
                  Text('');
            }
          } else {
            return SizedBox(height: 0);
          }
        }()),
        (() {
          if (purifiername.length > 0) {
            for (var i = 0; i < (purifiername.length); i++) {
              return PurifierTile(
                    purifier: purifiername[i],
                  ) ??
                  Text('');
            }
          } else {
            return SizedBox(height: 0);
          }
        }()),
      ],
    );
  }
}

// ListView.builder(
//       itemCount: newFilters.length,
//       itemBuilder: (context, index) {
//         return FilterTile(filter: newFilters[index]);
