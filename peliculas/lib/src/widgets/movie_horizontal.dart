import 'package:flutter/material.dart';
import 'package:peliculas/src/models/peliculas_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePAgina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePAgina});

  final pagecController =
      new PageController(initialPage: 1, viewportFraction: 0.3);
  @override
  Widget build(BuildContext context) {
    final _screesize = MediaQuery.of(context).size;

    pagecController.addListener(() {
      if (pagecController.position.pixels >=
          pagecController.position.maxScrollExtent - 200) {
        siguientePAgina();
      }
    });

    return Container(
      height: _screesize.height * 0.3,
      child: PageView.builder(
        pageSnapping: false,
        controller: pagecController,
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return tarjeta(context, peliculas[i]);
        },
      ),
    );
  }

  Widget tarjeta(BuildContext context, Pelicula pelicula) {
    final _screesize = MediaQuery.of(context).size;
    pelicula.uniqueId = '${pelicula.id}--poster';

    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(pelicula.getposter()),
                fit: BoxFit.cover,
                height: _screesize.height * 0.2,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    final _screesize = MediaQuery.of(context).size;

    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(pelicula.getposter()),
                fit: BoxFit.cover,
                height: _screesize.height * 0.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }).toList();
  }
}
