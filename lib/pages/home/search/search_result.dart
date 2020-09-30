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
  String type;
  SearchResult({this.name, this.type});
  @override
  Widget build(BuildContext context) {
    print('result');
    print(type);
    final services = Provider.of<List<Service>>(context) ?? [];
    services.sort((a, b) => b.date.compareTo(a.date));
    List<Service> servicename = [];
    List<Service> serviceNum = [];
    List<Service> serviceAddress = [];
    for (var i = 0; i < services.length; i++) {
      if (type == 'Type' || type == 'Service') {
        if (name == services[i].name) {
          servicename.add(services[i]);
        }
        if (name == services[i].number) {
          serviceNum.add(services[i]);
        }
        if (services[i].address.contains(name)) {
          serviceAddress.add(services[i]);
        }
      }
    }
    print(servicename);
    print(services);
    final purifiers = Provider.of<List<Purifier>>(context) ?? [];
    purifiers.sort((a, b) => b.date.compareTo(a.date));
    print(purifiers);
    List<Purifier> purifiername = [];
    List<Purifier> purifierNum = [];
    List<Purifier> purifierAddress = [];
    for (var i = 0; i < purifiers.length; i++) {
      if (type == 'Type' || type == 'Installation') {
        if (name == purifiers[i].name) {
          purifiername.add(purifiers[i]);
        }
        if (name == purifiers[i].number) {
          purifierNum.add(purifiers[i]);
        }
        if (purifiers[i].address.contains(name)) {
          purifierAddress.add(purifiers[i]);
        }
      }
    }
    print(purifiername);
    final filters = Provider.of<List<Filter>>(context) ?? [];
    filters.sort((a, b) => b.date.compareTo(a.date));
    List<Filter> filtername = [];
    List<Filter> filterNum = [];
    List<Filter> filterAddress = [];
    for (var i = 0; i < filters.length; i++) {
      if (type == 'Type' || type == 'Filter') {
        if (name == filters[i].name) {
          filtername.add(filters[i]);
        }
        if (name == filters[i].number) {
          filterNum.add(filters[i]);
        }
        if (filters[i].address.contains(name)) {
          filterAddress.add(filters[i]);
        }
      }
    }
    print(filtername);
    print('address');
    print(filterAddress);

    return SingleChildScrollView(
      child: Column(
        children: [
          (() {
            if (filtername.length > 0) {
              return Column(
                children: [
                  for (var item in filtername) FilterTile(filter: item)
                ],
              );
            } else if (filterNum.length > 0) {
              return Column(
                children: [
                  for (var item in filterNum) FilterTile(filter: item)
                ],
              );
            } else if (filterAddress.length > 0) {
              return Column(
                children: [
                  for (var item in filterAddress) FilterTile(filter: item)
                ],
              );
            } else {
              return SizedBox(height: 0);
            }
          }()),
          (() {
            if (servicename.length > 0) {
              return Column(
                children: [
                  for (var item in servicename) ServiceTile(service: item)
                ],
              );
            } else if (serviceNum.length > 0) {
              return Column(
                children: [
                  for (var item in serviceNum) ServiceTile(service: item)
                ],
              );
            } else if (serviceAddress.length > 0) {
              return Column(
                children: [
                  for (var item in serviceAddress) ServiceTile(service: item)
                ],
              );
            } else {
              return SizedBox(height: 0);
            }
          }()),
          (() {
            if (purifiername.length > 0) {
              return Column(
                children: [
                  for (var item in purifiername) PurifierTile(purifier: item)
                ],
              );
            } else if (purifierNum.length > 0) {
              return Column(
                children: [
                  for (var item in purifierNum) PurifierTile(purifier: item)
                ],
              );
            } else if (purifierAddress.length > 0) {
              return Column(
                children: [
                  for (var item in purifierAddress) PurifierTile(purifier: item)
                ],
              );
            } else {
              return SizedBox(height: 0);
            }
          }()),
        ],
      ),
    );
  }
}
