import 'package:filter/models/user.dart';
import 'package:filter/pages/wrapper.dart';
import 'package:filter/services/auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  @override
  void initState() {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return SplashScreen(
      seconds: 3,
      imageBackground: AssetImage('lib/assets/img/signup.png'),
      navigateAfterSeconds: StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Sans'),
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      ),
    );
  }
}
