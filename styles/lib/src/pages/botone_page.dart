import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class BotonesPage extends StatelessWidget {
  const BotonesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //statusBarColor: Colors.white
    // ));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondo(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[_texto(), tajetas()],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text('hola'), icon: Icon(Icons.calendar_today)),
          BottomNavigationBarItem(
              title: Text('adios'), icon: Icon(Icons.pie_chart_outlined)),
          BottomNavigationBarItem(
              title: Text('adios'), icon: Icon(Icons.sort_by_alpha)),
        ],
      ),
    );
  }

  Widget _fondo() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(52, 54, 101, 1.0),
        Color.fromRGBO(35, 37, 57, 1.0),
      ], begin: FractionalOffset(0, 0.5), end: FractionalOffset(0, 1))),
    );

    final caja = Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 300.0,
          width: 300.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(236, 98, 188, 1.0),
                Color.fromRGBO(240, 142, 172, 1.0)
              ]),
              borderRadius: BorderRadius.circular(70.0)),
        ));

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(top: -80, left: -20, child: caja),
      ],
    );
  }

  Widget _texto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'hola que tal',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('aelkcml lkecl lkeclk celkmcelm clkem',
                style: TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );
  }

  Widget tajetas() {
    return Container(
      child: Table(
        children: [
          TableRow(children: [
            botonRedondo(Icons.swap_calls),
            botonRedondo(Icons.swap_calls)
          ]),
          TableRow(children: [
            botonRedondo(Icons.swap_calls),
            botonRedondo(Icons.swap_calls)
          ]),
          TableRow(children: [
            botonRedondo(Icons.swap_calls),
            botonRedondo(Icons.swap_calls)
          ])
        ],
      ),
    );
  }

  Widget botonRedondo(IconData icon) {
    return ClipRRect(
          child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 35.0,
                backgroundColor: Colors.pink,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
