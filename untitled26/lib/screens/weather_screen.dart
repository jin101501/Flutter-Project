import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:untitled26/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:untitled26/main.dart';
import 'package:untitled26/progrem_list.dart';
import '../index.dart';


class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData, this.parseAirPollution});
  final dynamic parseWeatherData;
  final dynamic parseAirPollution;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();
  late String cityName;
  late int temp;
  late Widget icon;
  late String des;
  late Widget airIcon;
  late Widget airState;
  late double dust1;
  late double dust2;
  var date = DateTime.now();
  bool visible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var _email = "";
  var _password = "";

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;

    });

    _email = '${emailController.value.text}';
    _password = '${passwordController.value.text}';

    // Getting value from Controller

    print('${_email} ${_password}');
    // SERVER LOGIN API URL
    var url = 'http://192.168.225.44:8080/login.php';

    // Store all data with Param Name.
    var data = {'username': _email, 'pw': _password};

    return await http.post(Uri.parse(url), body: json.encode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 30)).then<bool>((http.Response response) async {
      if(response.statusCode != 200 || response.body == null || response.body == "{}"){ print("test1"); }
      else if(response.statusCode == 200){
        print('test2');
        print("${response.body}");
        if("${response.body}" != 'OK	'){
          print("아이디 혹은 비밀번호가 틀렸습니다.");
        }
        else{
          print("로그인 성공");
          session_id = _email;
          // Navigator.pushNamed(context, '/Index');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Index ()));
        }
        setState(() {
        });
      }
      return true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirPollution);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    double temp2 = weatherData['main']['temp'].toDouble();
    int condition = weatherData['weather'][0]['id'];
    des = weatherData['weather'][0]['description'];
    temp = temp2.round();
    cityName = weatherData['name'];
    icon = model.getWeatherIcon(condition)!;


    print(temp);
    print(cityName);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text('나의 화분관리'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_searching,
            ),
            onPressed: () {},
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.0,
                            ),
                            Text(
                              '$cityName',
                              style: GoogleFonts.lato(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  (Duration(minutes: 1)),
                                  builder: (context) {
                                    print('${getSystemTime()}');
                                    return Text(
                                      '${getSystemTime()}',
                                      style: GoogleFonts.lato(
                                          fontSize: 16.0, color: Colors.white),
                                    );
                                  },
                                ),
                                Text(DateFormat(' - EEEE, ').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white)),
                                Text(DateFormat('d MMM, yyy').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white))
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new TextFormField(
                              decoration: new InputDecoration(labelText: '아이디'),
                              controller: emailController,
                              validator: (value) =>
                              value!.isEmpty ? 'Email can\'t be empty' : null,
                              onSaved: (value) =>_email = value!,
                            ),
                            new TextFormField(
                              obscureText: true,
                              decoration: new InputDecoration(labelText: '비밀번호'),
                              controller: passwordController,
                              validator: (value) =>
                              value!.isEmpty ? 'Password can\'t be empty' : null,
                              onSaved: (value) =>_password = value!,
                            ),
                            new RaisedButton(
                              child: new Text(
                                '로그인',
                                style: new TextStyle(fontSize: 20.0),
                              ),
                              onPressed: userLogin,

                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temp\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                icon,
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '$des',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 8.0,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              SizedBox(
                                height: 8.0,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
