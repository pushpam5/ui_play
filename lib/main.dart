import 'package:flutter/material.dart';
import 'package:uiplay/home.dart';
import 'package:uiplay/login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => new MyApp(),
        '/homepage': (BuildContext context) => new HomePage(),
        //'/profile_image':(BuildContext context) => new Profile_Image()
      },
    );
  }
}
