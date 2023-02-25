import 'package:flutter/material.dart';
import 'package:untitled26/main.dart';
import 'package:untitled26/index.dart';
import 'package:untitled26/list.dart';
import 'package:untitled26/login_page.dart';
import 'package:untitled26/screens/loading.dart';
import 'package:untitled26/screens/weather_screen.dart';



final routes = {
  '/index' : (BuildContext context) => Index(),
  '/loading':(BuildContext context) => Loading(),
  '/screens/weather_screen' :(BuildContext context) => WeatherScreen(),
  '/main':(BuildContext context) => MyApp(),

};