import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItems() + _crearItemsCorto()
      ),
    );
  }

  List<Widget> _crearItems(){
    

    List<Widget> lista = new List<Widget>();

    for (var opt in opciones ) {
        final temp = ListTile(
          title: Text(opt),
        );
        lista..add(temp)
            ..add(Divider(color: Colors.black,));
    }

    return lista;
  }
 List<Widget> _crearItemsCorto(){
    
    var widgets = opciones.map(( intem ) {
      
        return Column(
          children: <Widget>[
            ListTile(
              title: Text( intem + '.'),
              subtitle: Text('jajjajajajjajajl'),
              leading: Icon( Icons.add ),
              trailing: Icon( Icons.arrow_downward),
              onTap: () {},
            ),
            Divider(color: Colors.black)
          ],
        );
    }).toList();

  return widgets;
}
}