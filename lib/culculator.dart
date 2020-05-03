import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Culculator'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              btnLogout(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                child: TextFormField(
                  controller: myController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Calculator',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: RaisedButton(
                            child: Text('1'),
                            color: Colors.blue,
                            onPressed: () => {
                              setState(() {
                                myController = TextEditingController(text: "1");
                              })
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: RaisedButton(
                            child: Text('2'),
                            color: Colors.blue,
                            onPressed: () => {
                              setState(() {
                                myController = TextEditingController(text: "2");
                              })
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: RaisedButton(
                            child: Text('3'),
                            color: Colors.blue,
                            onPressed: () => {
                              setState(() {
                                myController = TextEditingController(text: "3");
                              })
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future btnLogout(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();
  await pref.clear();
  Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
}
