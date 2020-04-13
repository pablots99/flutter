import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(), 
            Expanded(child: _creaImagen()),
            _crearCheckbox(),
            _crearSwitch(),
          ]
                    ),
                  ),
                );
              }
            
              Widget _createSlider() {
                return Slider(
                  activeColor: Colors.indigoAccent,
                  label: 'tamaño de la imagen',
                  divisions: 20,
                  value: _valorSlider,
                  min: 10.0,
                  max: 400.0,
                  onChanged: (_blockCheck)? null : (valor) {
                    setState(() {
                      _valorSlider = valor;
                    });
                  },
                );
              }
            
              Widget _creaImagen() {
                return Image(image: NetworkImage('https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2019/07/elon-musk.jpg?itok=8tWjadE3'),
                width: _valorSlider,
                fit: BoxFit.contain
                );
              }
            
              Widget _crearCheckbox() {
                return CheckboxListTile(
                  title: Text('Block'),
                  value: _blockCheck,
                  onChanged: (valor){
                    setState(() {
                      _blockCheck = valor;
                    });
                  }
                  );
              }
              Widget _crearSwitch() {
                return SwitchListTile(
                  title: Text('Block'),
                  value: _blockCheck,
                  onChanged: (valor){
                    setState(() {
                      _blockCheck = valor;
                    });
                  }
                  );
              }
}
