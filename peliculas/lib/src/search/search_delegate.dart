import 'package:flutter/material.dart';
import 'package:peliculas/src/models/peliculas_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  
  final peliculasprovider = new PeliculasProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    //aciones de nuestro appbar (cancelar busqueda)
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izq del appbar
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: (){
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // sugerenicas de cuando escribe la persona
    if (query.isEmpty){
      return Container();
    }
    return  FutureBuilder(
      future: peliculasprovider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData){

          final peliculas =snapshot.data;

          return ListView(
            children:peliculas.map((pelicula){
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getposter()),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                onTap: (){
                  close(context, null);
                  pelicula.uniqueId= '${pelicula.id}--busqueda';
                  Navigator.pushNamed(context, 'detalle',arguments: pelicula);
                },
              );
            }).toList(),
          );
        } else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    }
}
