import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/peliculas_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:peliculas/src/widgets/card_swipper.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(
              context: context,
              delegate: DataSearch(),
              );

          }),
        ],
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _swiperTarjetas(),
          _footer(context),
        ],
      )),
    );
  }

  Widget _swiperTarjetas() {
    peliculasProvider.getEnCines();

    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
               child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left:20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.title)),
          SizedBox(height: 10.0,),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context,AsyncSnapshot<List> snapshot){
              if(snapshot.hasData){
              return MovieHorizontal(peliculas: snapshot.data,siguientePAgina: peliculasProvider.getPopulares);
              }
              else{
                return Center(child: CircularProgressIndicator()); 
              }
            }
            )
        ],
      ),
    );
  }
}
