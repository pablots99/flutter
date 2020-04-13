import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alert'),
      ),
      body: Center(
        child: RaisedButton(
          child:Text('Mostrar'),
          onPressed: (){ _mostrarAlert(context);},
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
  void _mostrarAlert(BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: true,//salirse del poup tocando afuera
      builder: (context){
        return AlertDialog(
          title: Text('uygugy'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('contanido de la alerta'),
              FlutterLogo(size: 75),
              
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {Navigator.pop(context);},
             child: Text('cancelar'))
          ],
        );
      }
      );
  }
}