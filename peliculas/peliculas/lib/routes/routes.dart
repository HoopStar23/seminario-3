import 'package:flutter/material.dart';
import 'package:peliculas/screens/actor_details_screen.dart';
import 'package:peliculas/screens/home_screen.dart';
import 'package:peliculas/screens/details_screen.dart';

Map<String,WidgetBuilder> getApplicationsRoutes(){
  return<String, WidgetBuilder>{
    '/':(BuildContext context) => HomePage(),
    'details_screen':(BuildContext context) => DetailsScreen(),
    'actor_details_screen':(BuildContext context) => ActorDetailsScreen()
  };
}