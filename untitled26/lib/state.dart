import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled26/progrem_list.dart';
import 'package:untitled26/login_page.dart';
import 'package:untitled26/screens/weather_screen.dart';
import 'package:untitled26/screens/loading.dart';
import 'package:url_launcher/url_launcher.dart';
import'package:untitled26/url.dart';

import 'main.dart';

class StateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('나의 화분의 상태')
        ),
        body: JsonListView(),
      ),
    );
  }
}

class Studentdata {
  String datetime;
  String tem;
  String hum;
  String light;

  Studentdata({
    required this.datetime,
    required this.tem,
    required this.hum,
    required this.light
  });

  factory Studentdata.fromJson(Map<String, dynamic> json) {
    return Studentdata(
        datetime: json['date'],
        tem: json['tem'],
        hum: json['hum'],
        light: json['light']

    );
  }
}

class JsonListView extends StatefulWidget {

  JsonListViewWidget createState() => JsonListViewWidget();

}

class JsonListViewWidget extends State {

  final String apiURL = 'http://192.168.225.44:8080/plant.php';

  Future<List<Studentdata>> fetchStudents() async {

    var response = await http.get(Uri.parse(apiURL));

    if (response.statusCode == 200) {

      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Studentdata> studentList = items.map<Studentdata>((json) {
        return Studentdata.fromJson(json);
      }).toList();

      return studentList;
    }
    else {
      throw Exception('Failed to load data from Server.');
    }
  }

  selectedItem(BuildContext context, String dataHolder) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(dataHolder),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  logout(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Studentdata>>(
      future: fetchStudents(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) return Center(
            child: CircularProgressIndicator()
        );

        return ListView(
          children: snapshot.data!
              .map((data) => Column(children: <Widget>[
            GestureDetector(
              onTap: (){selectedItem(context, data.datetime);},
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    Container(
                      width: 50,
                      height: 50,
                    ),

                    Container(
                        width: 300,
                        height: 40,
                        margin: EdgeInsets.fromLTRB(50, 10, 10, 0),
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10), //border corner radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              //color of shadow
                              spreadRadius: 1,
                              //spread radius
                              blurRadius: 7,
                              // blur radius
                              offset:
                              Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[

                            Container(
                              height: 40,
                              width: 100,
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)
                                ),
                              ),
                              child: Text(
                                ' ' + '날짜',
                                style: TextStyle(fontSize: 17,color: Colors.white, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(
                                '${data.datetime.toString()}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                      width: 100,
                      height: 30,
                    ),
                    Container(
                        width: 300,
                        height: 40,
                        margin: EdgeInsets.fromLTRB(50, 0, 10, 0),
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10), //border corner radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              //color of shadow
                              spreadRadius: 1,
                              //spread radius
                              blurRadius: 7,
                              // blur radius
                              offset:
                              Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 100,
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)
                                ),
                              ),
                              child: Text(
                                ' ' + '온도',
                                style: TextStyle(fontSize: 17,color: Colors.white, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(
                                '${data.tem}°C',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                      width: 100,
                      height: 30,
                    ),
                    Container(
                        width: 300,
                        height: 40,
                        margin: EdgeInsets.fromLTRB(50, 0, 10, 0),
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10), //border corner radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              //color of shadow
                              spreadRadius: 1,
                              //spread radius
                              blurRadius: 7,
                              // blur radius
                              offset:
                              Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 100,
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    bottomLeft: Radius.circular(10.0)
                                ),
                              ),
                              child: Text(
                                ' ' + '습도',
                                style: TextStyle(fontSize: 17,color: Colors.white, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(
                                '${data.hum.toString()}%',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                      width: 100,
                      height: 30,
                    ),
                    Container(
                        width: 300,
                        height: 40,
                        margin: EdgeInsets.fromLTRB(50, 0, 10, 0),
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10), //border corner radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              //color of shadow
                              spreadRadius: 1,
                              //spread radius
                              blurRadius: 7,
                              // blur radius
                              offset:
                              Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 100,
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)
                                ),
                              ),
                              child: Text(
                                ' ' + '광도',
                                style: TextStyle(fontSize: 17,color: Colors.white, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(
                                '${data.light}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 200,
                      width:  double.maxFinite,
                      child: Card(
                          child: Row(
                            children: [
                              Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Expanded(
                                      child: Image.asset('image/stuky.png'),
                                      flex: 1,
                                    ),

                                  )
                              ),
                              Expanded(
                                  child:Container(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: const [
                                        Expanded(
                                            flex:3,
                                            child: ListTile(
                                              title: Text("스투키(공기정화 식물)",
                                                  style: TextStyle(fontWeight: FontWeight.bold)),
                                            )
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child:Text("-물주기 : 3~4주에 1번"),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child:Text("-적정 환경 : 햇빛 잘드는 곳"),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child:Text("-가격 : 10,000내외(화분포함)"),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child:Text("-생육온도 : 18~27도"),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                      Container(
                      width: 150,
                      height: 100,
                      alignment: Alignment.center,
                    ),
                    new RaisedButton(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: new Text(
                        '로그아웃',
                        style: new TextStyle(fontSize: 15.0),
                      ),
                      onPressed: logout,

                    ),
                        ]
                      )
                    )
                  ]),),
            Divider(color: Colors.black),
          ],))
              .toList(),
        );

      },
    );
  }
}