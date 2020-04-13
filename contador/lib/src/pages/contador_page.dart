import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class Contador extends StatefulWidget {
  @override
  createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  final estilo = new TextStyle(fontSize: 20);

  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tit'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'clucks',
              style: estilo,
            ),
            Text(
              contador.toString(),
              style: estilo,
            ),
          ],
        ),
      ),
      floatingActionButton: _botones(),
    );
  }

  Widget _botones() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
            FloatingActionButton(child: Icon(Icons.add), onPressed: () {setState( () => contador++);},),
            SizedBox(width: 3.0,),
            FloatingActionButton(child: Icon(Icons.remove), onPressed: () {setState( () => contador--);},),
            SizedBox(width: 3.0,),
            FloatingActionButton(child: Icon(Icons.restore), onPressed: () {setState( () => contador = 0);},),
      ],
    );
    
    
  }
}
