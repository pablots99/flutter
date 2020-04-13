import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }

 Future<List<dynamic>> cargarData() async {
    final resp =
        await rootBundle.loadString('docs/menu_opts.json');

      Map datamap = json.decode(resp);
      opciones = datamap['rutas'];

      return opciones;

  }
}

final menuProvider = new _MenuProvider();
