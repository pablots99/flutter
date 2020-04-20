import 'package:flutter/material.dart';
import 'package:peliculas/src/models/acotres_mode.dart';
import 'package:peliculas/src/models/peliculas_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class PeliculaDEtalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _creaAppbar(pelicula),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 10.0,
            ),
            _posterTitulo(context, pelicula),
            _desipcion(pelicula),
            _desipcion(pelicula),
            _desipcion(pelicula),
            _desipcion(pelicula),
            _crearCast(pelicula),
          ]),
        ),
      ],
    ));
  }

  Widget _creaAppbar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      title: Text(pelicula.title),
      floating: false,
      pinned: true,
    );
  }

  Widget _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 150.0,
                  image: NetworkImage(pelicula.getposter()),
                )),
          ),
          SizedBox(
            width: 15.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                pelicula.title,
                style: Theme.of(context).textTheme.title,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(pelicula.originalTitle,
                  style: Theme.of(context).textTheme.subhead,
                  overflow: TextOverflow.ellipsis),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star_border),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(pelicula.voteAverage.toString(),
                      style: Theme.of(context).textTheme.subhead)
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _desipcion(Pelicula pelicula) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Text(
          pelicula.overview,
          textAlign: TextAlign.justify,
        ));
  }

  Widget _crearCast(Pelicula pelicula) {
    final peliProvider = new PeliculasProvider();

    return FutureBuilder(
        future: peliProvider.getCast(pelicula.id.toString()),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return _actoresPageview(snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _actoresPageview(List<Actor> actores) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
          pageSnapping: false,
          itemCount: actores.length,
          controller: PageController(viewportFraction: 0.3, initialPage: 1),
          itemBuilder: (context, i) {
            return _actorTarjeta(actores[i]);
          }),
    );
  }

  Widget _actorTarjeta(Actor actor) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: FadeInImage(
              image: NetworkImage(actor.getfoto()),
              placeholder: AssetImage('assets/no-image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Text(actor.name)
        ],
      ),
    );
  }
}
