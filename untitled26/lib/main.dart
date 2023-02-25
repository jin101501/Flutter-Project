import 'package:flutter/material.dart';
import 'package:untitled26/screens/loading.dart';
import 'package:untitled26/screens/weather_screen.dart';
var session_id = "";
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Loading(),
    );
  }
}