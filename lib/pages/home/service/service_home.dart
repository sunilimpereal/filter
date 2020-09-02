import 'package:filter/models/service.dart';
import 'package:filter/models/user.dart';
import 'package:filter/pages/home/home.dart';
import 'package:filter/pages/home/service/service_form.dart';
import 'package:filter/pages/home/service/service_list.dart';
import 'package:filter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceHome extends StatefulWidget {
  @override
  _ServiceHomeState createState() => _ServiceHomeState();
}

class _ServiceHomeState extends State<ServiceHome> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<Service>>.value(
      value: DatabaseService(uid: user.uid).serviceList,
      child: Scaffold(
        backgroundColor: Color(0xFFFDFFFC),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue[300],
          title: Text(
            'Services',
            style: TextStyle(color: Color(0xFF153243)),
          ),
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Color(0xFF153243),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ServiceForm()));
              },
            )
          ],
        ),
        body: ServiceList(),
      ),
    );
  }
}
