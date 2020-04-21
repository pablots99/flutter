import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 15.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image(
                image: NetworkImage(
                    'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg')),
            primeraTarjeta(),
            acciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  Widget primeraTarjeta() {
    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Foto Titulo',
                    style: estiloTitulo,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Foto Descrippcionn',
                    style: estiloSubTitulo,
                  )
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }

  Widget acciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'call'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'share'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
          size: 40.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _crearTexto() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        'Sint dolor anim Lorem ad aliquip ipsum fugiat quis aliqua. Aliqua est aliquip minim duis minim. Id et ipsum tempor dolor eiusmod eu amet veniam aute sunt elit consequat deserunt cillum.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
