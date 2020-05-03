import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    startTime(5, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }

  startTime(int splashDuration, BuildContext context) async {
    var token = await getToken();
    return Timer(Duration(seconds: splashDuration), () {
      print(token);
      if (token != null) {
        Navigator.of(context).pushReplacementNamed('/culculator');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  Future<int> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('token');
  }
}
