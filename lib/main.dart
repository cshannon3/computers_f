import 'package:computers_f/reading_bits.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ReadingBits(),
      ),
    );
  }
}

class AndGate extends StatefulWidget {
  @override
  _AndGateState createState() => _AndGateState();
}

class _AndGateState extends State<AndGate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // bit,
        Container(
          height: 130.0,
          width: 150.0,
          color: Colors.grey,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
