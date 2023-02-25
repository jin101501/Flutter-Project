import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled26/list.dart';
import 'package:untitled26/login_page.dart';
import 'package:untitled26/progrem_list.dart';
import 'package:untitled26/state.dart';
import 'package:untitled26/screens/weather_screen.dart';




class Index extends StatefulWidget {
  @override

  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:TabBarView(
          children: <Widget>[
            StateApp(),
            ListApp()


          ] ,
          controller: controller,
        ),
        bottomNavigationBar:TabBar(tabs: <Tab>[
          Tab(icon: Icon(Icons.home,color: Colors.blue,),),
          Tab(icon: Icon(Icons.construction,color: Colors.blue,),)
        ], controller: controller,
        )
    );
  }
}