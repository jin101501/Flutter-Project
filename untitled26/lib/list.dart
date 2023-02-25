import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled26/main.dart';
import 'package:untitled26/progrem_list.dart';
import 'package:untitled26/state.dart';


void main() => runApp(ListApp());

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('수동제어 모드')),
            body: Center(
                child: RegisterUser()
            )
        )
    );
  }
}

class RegisterUser extends StatefulWidget {

  RegisterUserState createState() => RegisterUserState();

}

class RegisterUserState extends State {

  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;
  bool state1 = false;
  bool state2 = false;
  bool isSwitchOn = false;
  Color _textColor = Colors.black;
  Color _appBarColor = Color.fromRGBO(36, 41, 46, 1);
  Color _scaffoldBgcolor = Colors.white;
  String plantmode = "A";
  bool status1=false;

  Future userRegistration_mode_M() async{
    print("수동모드 전환완료");
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String ID = session_id;
    String buttonA = "N";
    String buttonB = "N";
    plantmode = "M";
    String buttonC = "N";

    // SERVER API URL
    var url = 'http://192.168.225.44:8080/state.php';

    // Store all data with Param Name.
    var data = {'ID': ID,'plantmode': plantmode, 'buttonA': buttonA, 'buttonB' : buttonB,'buttonC':buttonC};

    return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 30)).then<bool>((http.Response response) async {
      if(response.statusCode != 200 || response.body == null || response.body == "{}" ){ print("test1"); }
      else if(response.statusCode == 200){

        setState(() {
        });
      }
      return true;
    });

  }

  Future userRegistration_A() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String ID = session_id;
    plantmode = "M";
    String buttonA = "Y";
    String buttonB = "N";
    String buttonC = "N";

    // SERVER API URL
    var url = 'http://192.168.225.44:8080/state.php';

    // Store all data with Param Name.
    var data = {'ID': ID,'plantmode': plantmode, 'buttonA': buttonA, 'buttonB' : buttonB,'buttonC':buttonC};

    return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 30)).then<bool>((http.Response response) async {
      if(response.statusCode != 200 || response.body == null || response.body == "{}" ){ print("test1"); }
      else if(response.statusCode == 200){

        setState(() {
        });
      }
      return true;
    });

  }

  Future userRegistration_B() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String ID = session_id;
    plantmode = "M";
    String buttonA = "N";
    String buttonB = "Y";
    String buttonC = "N";

    // SERVER API URL
    var url = 'http://192.168.225.44:8080/state.php';

    // Store all data with Param Name.
    var data = {'ID': ID,'plantmode': plantmode, 'buttonA': buttonA, 'buttonB' : buttonB,'buttonC':buttonC};

    return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 30)).then<bool>((http.Response response) async {
      if(response.statusCode != 200 || response.body == null || response.body == "{}" ){ print("test1"); }
      else if(response.statusCode == 200){

        setState(() {
        });
      }
      return true;
    });

  }

  Future userRegistration_C() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String ID = session_id;
    plantmode = "M";
    String buttonA = "N";
    String buttonB = "N";
    String buttonC = "Y";

    // SERVER API URL
    var url = 'http://192.168.225.44:8080/state.php';

    // Store all data with Param Name.
    var data = {'ID': ID,'plantmode': plantmode, 'buttonA': buttonA, 'buttonB' : buttonB,'buttonC':buttonC};

    return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 30)).then<bool>((http.Response response) async {
      if(response.statusCode != 200 || response.body == null || response.body == "{}" ){ print("test1"); }
      else if(response.statusCode == 200){

        setState(() {
        });
      }
      return true;
    });


  }

  Future userRegistration_mode_A() async{
    print("자동모드 전환완료");
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String ID = session_id;
    plantmode = "A";
    String buttonA = "N";
    String buttonB = "N";
    String buttonC = "N";

    // SERVER API URL
    var url = 'http://192.168.225.44:8080/state.php';

    // Store all data with Param Name.
    var data = {'ID': ID,'plantmode': plantmode, 'buttonA': buttonA, 'buttonB' : buttonB,'buttonC':buttonC};

    return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 30)).then<bool>((http.Response response) async {
      if(response.statusCode != 200 || response.body == null || response.body == "{}" ){ print("test1"); }
      else if(response.statusCode == 200){

        setState(() {
        });
      }
      return true;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                      Container(
                        height: 20.0,
                      ),
                      FlutterSwitch(
                        value: status1,
                        width:120.0 ,
                        height: 55.0,
                        borderRadius: 30.0,
                        padding: 2.0,
                        toggleColor: Colors.green,
                        switchBorder: Border.all(
                          color: Colors.green,
                          width: 3.0,
                        ),
                        toggleBorder: Border.all(
                          color: Colors.green,
                          width: 5.0,
                        ),
                        activeColor: Colors.limeAccent,
                        inactiveColor: Colors.white,
                        onToggle: (val) {
                          setState(() {
                            status1=val;
                            if(status1==false){
                              userRegistration_mode_A();
                            }
                            else if (status1==true){
                              userRegistration_mode_M();
                            }
                          });
                        },
                      ),
                      if(status1==false)
                        Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 100,
                          child: Text("자동모드",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                      if(status1==true)
                        Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 100,
                          child: Text("수동모드",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                      if(status1==false)
                        Container(
                          child: Image.asset(
                            'image/plant.png',
                            width: 70 ,
                            height:70 ,
                          ) ,
                        ),
                      if(status1==false)
                        Container(
                          height: 50.0,
                        ),
                      if(status1==false)
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 340,
                          height: 50,
                          child: Text("- 온도가 어느정도 될 경우 자동으로 물 주기",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                        ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 340,
                        height: 50,
                        child: Text("   (임계치 가 수분값보다 작으면 동작)",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                      if(status1==false)
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 340,
                          height: 50,
                          child: Text("- 습도가 어느정도 될 경우 자동으로 조명 비추기",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                        ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 340,
                        height: 50,
                        child: Text("   (조도 센서의 값이 1000 이상일경우 LED ON)",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                      Container(
                        width: 132,
                        height: 50,
                      ),
                      if(status1==true)
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 50,
                              ),
                              Container(
                                child: Image.asset(
                                  'image/water2.png',
                                  width: 60 ,
                                  height:70 ,
                                ) ,
                              ),
                              Container(
                                width: 40,
                                height: 50,
                              ),
                              RaisedButton(
                                onPressed: userRegistration_A,
                                color: Colors.lightBlueAccent,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                                child: Text('5초동안 물주기',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:18)),
                              ),
                            ],
                          ),
                        ),
                      Container(
                        width: 70,
                        height: 20,
                      ),
                      if(status1==true)
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 50,
                              ),
                              Container(
                                child: Image.asset(
                                  'image/sun.png',
                                  width: 60 ,
                                  height:70 ,
                                ) ,
                              ),
                              Container(
                                width: 40,
                                height: 50,
                              ),
                              RaisedButton(
                                onPressed: userRegistration_B,
                                color: Colors.orange,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                                child: Text('5초동안 조명 켜기',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:18)),

                              ),
                            ],
                          ),

                        )]))));
  }
}





