import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
          children: <Widget>[_cardTipo1(), SizedBox(height: 15), _cardTipo2()],
          padding: EdgeInsets.all(18)),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0, //sombra
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)), //borde forma
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Tarjeta 1'),
            subtitle: Text('asnkcakjsnaksjnkjsacnkajscn'),
          ),
          Row(
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text('cancelar')),
              FlatButton(onPressed: () {}, child: Text('ok')),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,//no se salga el contenido de la tarjeta
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://cdn.cnn.com/cnnnext/dam/assets/190517091026-07-unusual-landscapes-travel.jpg'),
            placeholder: AssetImage('assets/load_image.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 200,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black45, blurRadius: 15.0, spreadRadius: 2.0)
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: card,
      ),
    );
  }
}
