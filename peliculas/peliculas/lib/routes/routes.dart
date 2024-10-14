import 'package:flutter/material.dart';
import 'package:peliculas/screens/home_screen.dart';

Map<String,WidgetBuilder> getApplicationsRoutes(){
  return<String, WidgetBuilder>{
    '/':(BuildContext context) => HomePage(),
  };
}