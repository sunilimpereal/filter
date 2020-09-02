import 'package:filter/models/service.dart';
import 'package:filter/pages/home/service/servicetile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceList extends StatefulWidget {
  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    final services = Provider.of<List<Service>>(context);
    services.sort((a, b) => b.date.compareTo(a.date));
    print(services);
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        return ServiceTile(service: services[index]);
      },
    );
  }
}
