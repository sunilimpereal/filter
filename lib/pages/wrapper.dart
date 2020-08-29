import 'package:filter/models/user.dart';
import 'package:filter/pages/authenticate/authenticate.dart';
import 'package:filter/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return home or auth
    if (user != null) {
      return Home();
    } else {
      return Authenticate();
    }
  }
}
