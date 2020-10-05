import 'package:filter/models/service.dart';
import 'package:filter/pages/home/service/servicetile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceList extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  ServiceList({this.startDate, this.endDate});
  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    final services = Provider.of<List<Service>>(context) ?? [];
    services.sort((a, b) => b.date.compareTo(a.date));
    print(services);
    List<Service> newServices = [];
    for (var i = 0; i < services.length; i++) {
      DateTime ndate = DateTime.parse(services[i].date);
      if (ndate.isAfter(widget.startDate.subtract(Duration(days: 1))) &&
          ndate.isBefore(widget.endDate.subtract(Duration(days: 1)))) {
        newServices.add(services[i]);
      }
    }
    return ListView.builder(
      itemCount: newServices.length,
      itemBuilder: (context, index) {
        return ServiceTile(service: newServices[index]);
      },
    );
  }
}
