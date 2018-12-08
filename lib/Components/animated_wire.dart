import 'package:flutter/material.dart';

class AnimatedWire extends StatefulWidget {
  final double wireLength;
  final double wireThickness;
  final List<bool> bitValues;
  // final  Flow Direction enum TODO

  const AnimatedWire(
      {Key key, this.wireLength, this.wireThickness, this.bitValues})
      : super(key: key);
  @override
  _AnimatedWireState createState() => _AnimatedWireState();
}

class _AnimatedWireState extends State<AnimatedWire>
    with TickerProviderStateMixin {
  AnimationController controller;
  // ScrollController scrollController; TODO could probably make elecs a list instead of indivs

  @override
  void initState() {
    super.initState();
    //scrollController = ScrollController().. Cou
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..addListener(() {
            setState(() {});
          })
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // wire
      width: widget.wireLength,
      height: widget.wireThickness,
      decoration: BoxDecoration(
          color: Colors.grey[400],
          border: Border(
              top: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black))),

      child: Stack(
        children: List.generate((widget.wireLength / 40).floor(), (i) {
          double xposition =
              ((i * widget.wireLength / ((widget.wireLength / 40).floor())) +
                      controller.value * widget.wireLength) %
                  widget.wireLength;
          return Align(
            alignment: Alignment.bottomLeft,
            child: Transform(
              transform: Matrix4.translationValues(
                  controller.value != null ? xposition : 0.0,
                  -widget.wireThickness *
                      1 /
                      5, //  MediaQuery.of(context).size.height - 50.0 - 30.0 - 10.0,
                  0.0),
              child: (!widget.bitValues[0] &&
                      xposition > widget.wireLength / 2 - 80.0) // need bitwidth
                  ? SizedBox()
                  : Container(
                      height: widget.wireThickness * 3 / 5,
                      width: widget.wireThickness * 3 / 5,
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Center(
                        child: Container(
                          height: widget.wireThickness /
                              (widget.wireLength / 40).floor(),
                          width: widget.wireThickness *
                              3 /
                              (widget.wireLength / 40).floor(),
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          );
        }),
      ),
    );
  }
}
