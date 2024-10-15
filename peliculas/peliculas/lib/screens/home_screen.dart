import 'package:flutter/material.dart';
import 'package:peliculas/widgets/card_swiper.dart';
import 'package:peliculas/widgets/movie_slider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //String nombre = '';
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 20,
      ),
        body: SingleChildScrollView(
          child: Column(
          children: [
            CardSwiper(),
            MovieSlider(),
            ],
          ),
        ) 
      );
  }
}