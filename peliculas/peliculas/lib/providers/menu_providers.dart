import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones = [];

  Future<List<dynamic>> cargarData() async{//Future  representa un valor que se esta preparando para el futuro. Ya que no esta lista inmediatemente. Un async simepre devuelve un Future
    final resp = await rootBundle.loadString('data/menu_opts.json');// Cargar JSON

      Map dataMap = json.decode(resp);//El JSON es convertido en un Dart Map
      print(dataMap['rutas']);
      opciones = dataMap['rutas'];

      return opciones;
  }
}

final menuProvider = new _MenuProvider();