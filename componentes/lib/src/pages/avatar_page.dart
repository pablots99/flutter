import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('avatar'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/4/49/Elon_Musk_2015.jpg'),
            radius: 20.0,
            
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('hh'),
              backgroundColor: Colors.red,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/load_image.gif'),
          fadeInDuration: Duration(milliseconds: 300),
          image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/4/49/Elon_Musk_2015.jpg')) ,
        ),
    );
  }
}
