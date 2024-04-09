import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todooooooooooooooooooooooooooooooo/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDoo_App',
      theme: ThemeData(
          // Define your app's theme here
          ),
      home: Home(), // Use the Home class as the home screen
    );
  }
}
