import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ëxpense Tracker",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("flutter app"),
        ),
        body: Column(
          children: [
            Card(
              color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: Text("CHART!"),
              ),
              elevation: 5,
            ),
            Card(
              child: Text("List of TX"),
            ),
          ],
        ));
  }
}
