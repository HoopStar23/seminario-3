import 'package:flutter/material.dart';
import 'package:peliculas/routes/routes.dart';
import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      debugShowCheckedModeBanner: false,
      initialRoute: 'details_screen',
      routes: getApplicationsRoutes(),
      theme: ThemeData.light().copyWith(appBarTheme: AppBarTheme(color: Colors.indigo)),
      //home
    );
  }
}