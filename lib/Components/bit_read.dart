import 'package:flutter/material.dart';

class BitRead extends StatelessWidget {
  final bool bitIsOn;
  final double bitHeight;
  final double bitWidth;
  final double wireThickness;
  // final double wireSectionWidth;// This will scale the size to make sure all bits fit
  // requiring this cuz idk what default would be

  const BitRead({
    Key key,
    this.bitIsOn = false,
    this.bitHeight,
    this.bitWidth,
    this.wireThickness,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bitHeight + (wireThickness * 2.5),
      width: bitWidth * 1.5,
      child: Column(
        children: <Widget>[
          Container(
            height: bitHeight,
            width: bitWidth,
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: bitIsOn
                      ? [Colors.red, Colors.blue]
                      : [Colors.blue, Colors.red],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  bitIsOn ? "0" : "1",
                  style: TextStyle(color: Colors.white, fontSize: bitWidth / 3),
                ),
                Text(
                  bitIsOn ? "1" : "0",
                  style: TextStyle(color: Colors.white, fontSize: bitWidth / 3),
                ),
              ],
            ),
          ),
          Container(
              height: wireThickness * 2.5,
              width: bitWidth * 1.5,
              //color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Container(
                    color: Colors.grey,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        height: wireThickness,
                        color: Colors.grey,
                      )),
                      Container(
                        height: wireThickness,
                        width: bitWidth,
                        decoration: bitIsOn
                            ? BoxDecoration(color: Colors.white)
                            : BoxDecoration(
                                color: Colors.red[300],
                                border: Border(
                                    top: BorderSide(color: Colors.black),
                                    bottom: BorderSide(color: Colors.black))),
                      ),
                      Expanded(
                          child: Container(
                        height: wireThickness,
                        color: Colors.grey,
                      )),
                    ],
                  ),
                  Opacity(
                    opacity: bitIsOn ? 0.5 : 1.0,
                    child: Container(
                      height: wireThickness,
                      width: bitWidth,
                      decoration: !bitIsOn
                          ? BoxDecoration(color: Colors.white)
                          : BoxDecoration(
                              color: Colors.red[300],
                              border: Border(
                                  top: BorderSide(color: Colors.black),
                                  bottom: BorderSide(color: Colors.black))),
                    ),
                  ),
                ],
              )),
          //   Positioned(
          //   top: MediaQuery.of(context).size.height / 2 - 10.0,
        ],
      ),
    );
  }
}
