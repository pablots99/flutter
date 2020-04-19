import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/models/peliculas_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = '02cd58f9f79c9cd5f30f8ac2d04adfc9';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  bool cargando = false;

  int _popularesPge = 0;

  List<Pelicula> _populares = new List();
  
  final _popuareStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>)get popularesSink => _popuareStreamController.sink.add;

  Stream<List<Pelicula>>get popularesStream => _popuareStreamController.stream;

  void dispose(){
    _popuareStreamController.close();
  }

  Future<List<Pelicula>> _resp(Uri url) async {
    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(
        _url, '3/movie/now_playing', {'api_key': _apikey, 'laguge': _language});
    return _resp(url);
  }

  Future<List<Pelicula>> getPopulares() async {

    if(cargando) return[];
    cargando = true;

    _popularesPge++;
    final url = Uri.https(
        _url, '3/movie/popular', {
          'api_key': _apikey, 
          'laguge': _language,
          'page' :_popularesPge.toString(),
          });

    final respuesta= await _resp(url);
    _populares.addAll(respuesta);
    popularesSink(_populares);
    return respuesta;
  }
}
