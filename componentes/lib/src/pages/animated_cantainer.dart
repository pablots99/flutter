import 'dart:math';

import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  Animated({Key key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.red;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInBack,
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _width = Random().nextInt(300).toDouble();
            _heigth = Random().nextInt(300).toDouble();
            _color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
            _borderRadius = BorderRadius.circular(Random().nextInt(300).toDouble());
          });
        },
        child: Icon(Icons.track_changes),
      ),
    );
  }
}
