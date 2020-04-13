import 'package:flutter/material.dart';

class Inputpage extends StatefulWidget {
  Inputpage({Key key}) : super(key: key);

  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  String _nombre = '';
  String _emailvar;
  String _fecha = '';
  String _opcionSel = 'volar';
  List<String> _poderes = ['volar', 'superfuerza', 'jajjajaaj', 'hbhjbhbjhb'];

  TextEditingController _datecontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: <Widget>[
          _creaInput(),
          Divider(),
          _email(),
          Divider(),
          _password(),
          Divider(),
          create_date(context),
          Divider(),
          _createDropdowm(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _creaInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          counter: Text('letras: ${_nombre.length}'),
          hintText: 'nombre persona',
          labelText: 'Nombre',
          helperText: 'solo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('email: $_emailvar'),
      trailing: Text(_opcionSel),
    );
  }

  Widget _email() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _emailvar = valor;
        });
      },
    );
  }

  Widget _password() {
    return TextField(
      obscureText: true,
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock_outline),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _emailvar = valor;
        });
      },
    );
  }

  Widget create_date(BuildContext context) {
    return TextField(
      controller: _datecontroller,
      enableInteractiveSelection: false,
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          hintText: 'Fecha',
          labelText: 'fecha',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _datecontroller.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDopDown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      print(poder);
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _createDropdowm() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _opcionSel,
          items: getOpcionesDopDown(),
          onChanged: (opt) {
            setState(() {
              _opcionSel = opt;
            });
          },
        ),
      ],
    );
  }
}
