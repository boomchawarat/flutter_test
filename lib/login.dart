import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/culculator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final String nameApp;

  const LoginPage({
    Key key,
    this.nameApp = "Logitach",
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          funcLogo(),
          inputLogin(),
          btnSubmit(context),
        ],
      )),
    );
  }

  Widget funcLogo() {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
              margin: EdgeInsets.only(top: 50),
              height: 100,
              width: 100,
              child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR4DmfmVewn6grwsrTlQLRSp_mLySGj_ADwgSX_rfQmZSK7tUe6&usqp=CAU")),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Column(
            children: <Widget>[
              Text("Name App : ${widget.nameApp}"),
              Text("Login"),
            ],
          ),
        ),
      ],
    );
  }

  Widget inputLogin() {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Username',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Password',
              ),
            ),
          ],
        ));
  }

  Widget btnSubmit(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Submit'),
        color: Colors.blue,
        onPressed: () => {
          fetchLogin().then((value){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => CalculatorPage()));
          }),
        },
      ),
    );
  }
}

Future<LoginRes> fetchLogin() async {
  final res = await http.get('https://jsonplaceholder.typicode.com/todos/1');
  var loginRes = LoginRes.fromJson(json.decode(res.body));
  saveToken(loginRes.id);
  return loginRes;
}

 saveToken(int token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('token', token);
}

class LoginRes {
  final int userID;
  final int id;
  final String title;
  final bool completes;

  LoginRes({this.userID, this.id, this.title, this.completes});

  factory LoginRes.fromJson(Map<String, dynamic> json) {
    return LoginRes(
      userID: json['userId'],
      id: json['id'],
      title: json['title'],
      completes: json['completed'],
    );
  }
}
