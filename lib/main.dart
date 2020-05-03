import 'package:flutter/material.dart';
import 'package:flutterapp/culculator.dart';
import 'package:flutterapp/splash.dart';
import 'login.dart';

void main() => runApp(StartPage());

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Culcator',
//      home: Splash(),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/login' : (context) => LoginPage(),
        '/culculator' : (context) => CalculatorPage(),
      }
    );
  }
}
