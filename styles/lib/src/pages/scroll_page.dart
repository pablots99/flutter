import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scrollpage extends StatelessWidget {
  const Scrollpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(),
        ],
      ),
    );
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFond(),
        Image(
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          image: AssetImage('assets/original.png'),
        ),
        _textos()
      ],
    );
  }

  Widget _pagina2() {
    return Center(
      child: Text('Pagina2'),
    );
  }

  Widget _colorFond() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 0.9),
    );
  }

  Widget _textos() {
    final estilotexto = TextStyle(color: Colors.white, fontSize: 50.0);
    

    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: <Widget>[
            Text(
              '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}',
              style: estilotexto,
            ),
            Text('miercoeles',style: estilotexto,),
            Expanded(child: Container(),),
            Icon(Icons.keyboard_arrow_down,size: 70.0, color:Colors.white,)
          ],
        ),
      ),
    );
  }

 
}
