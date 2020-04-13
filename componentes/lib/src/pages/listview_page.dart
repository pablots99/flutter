import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  int _ultimoItem = 0;
  bool _isloading = false;

  ScrollController _scrollController = new ScrollController();

  List<int> _numList = new List();

  @override
  void initState() {
    super.initState();
    agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('listas'),
        ),
        body: Stack(children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ]));
  }

  Widget _crearLista() {
    return RefreshIndicator(
          child: ListView.builder(
          itemCount: _numList.length,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _numList[index];
            return FadeInImage(
                placeholder: AssetImage('assets/load_image.gif'),
                image:
                    NetworkImage('https://picsum.photos/500/300/?image=$imagen'));
          }),
          onRefresh: obtenerPAgina1,
    );
  }

  Future<Null> obtenerPAgina1() async{

    final duration =new Duration(seconds: 2);
    new Timer(duration,(){
      _numList.clear();
      _ultimoItem++;
      agregar10();
    });
    return Future.delayed(duration);
  }

  void agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _numList.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isloading = true;
    final duration = new Duration(seconds: 2);
    setState(() {});
    return new Timer(duration, respuestaHTTP);
    
  }

  void respuestaHTTP() {
    _isloading = false;
    agregar10();
  }

  @override
  void dispose() {
    _scrollController.dispose();
  }

  Widget _crearLoading() {
    if (_isloading) {
      return CircularProgressIndicator();
    } else {
      return Container();
    }
  }
}
