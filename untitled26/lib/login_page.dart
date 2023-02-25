import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled26/list.dart';
import 'package:untitled26/index.dart';
import 'package:untitled26/progrem_list.dart';
import 'package:untitled26/state.dart';
import 'package:untitled26/screens/weather_screen.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: new AppBar(
        title: new Text('로그인 페이지'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16),
        child: new Form(
          child: new Column(
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
        ),
      ),
    );
  }
}
