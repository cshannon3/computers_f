import 'package:computers_f/Components/animated_wire.dart';
import 'package:computers_f/Components/bit_read.dart';
import 'package:flutter/material.dart';

class ReadingBits extends StatefulWidget {
  ReadingBits({Key key}) : super(key: key);

  @override
  _ReadingBitsState createState() => new _ReadingBitsState();
}

class _ReadingBitsState extends State<ReadingBits> {
  //   with TickerProviderStateMixin {
  //AnimationController controller;
  //Animation<double> animation;
  //AnimationController wirepartController;
  bool bitIsOn;
  bool writeOn;

  @override
  void initState() {
    super.initState();
    bitIsOn = true;
    writeOn = false;
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    return //new Scaffold(body:
        Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: FractionalTranslation(
                    translation: Offset(0.0, 1.0),
                    child: Text(
                      "READ",
                      style: TextStyle(fontSize: 40.0),
                    )),
              ),
              Center(
                child: FractionalTranslation(
                  translation: Offset(0.0, -0.7),
                  child: Container(
                    height: 200.0,
                    width: 300.0,
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "WRITE",
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                                child: Text("+",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      // fontWeight: FontWeight.bold,
                                    )),
                                onPressed: () {
                                  if (writeOn) {
                                    setState(() {
                                      bitIsOn = true;
                                    });
                                  }
                                }),
                            RaisedButton(
                                child: Text(
                                  writeOn ? "OFF" : "ON",
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    writeOn = !writeOn;
                                  });
                                }),
                            RaisedButton(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  if (writeOn) {
                                    setState(() {
                                      bitIsOn = false;
                                    });
                                  }
                                }),
                            //   RaisedButton(onPressed: null),
                          ],
                        ),
                        Row(
                          children: writeOn
                              ? List.generate(15, (i) {
                                  return Container(
                                    width: 20.0,
                                    child: Text(
                                      bitIsOn ? "+" : "-",
                                      style: TextStyle(
                                        color:
                                            bitIsOn ? Colors.red : Colors.blue,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                })
                              : [],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedWire(
                  wireLength: MediaQuery.of(context).size.width,
                  wireThickness: 50.0,
                  bitValues: [bitIsOn],
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: MediaQuery.of(context).size.width / 2 - 75.0,
                child: BitRead(
                  bitIsOn: bitIsOn,
                  bitHeight: 250.0,
                  wireThickness: 50.0,
                  bitWidth: 100.0,
                ),
              )
            ])
            //),
            // ),
            //  ),
            // This trailing comma makes auto-formatting nicer for build methods.
            );
  }
}
