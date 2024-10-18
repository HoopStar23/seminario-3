import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/card_swiper.dart';
import 'package:peliculas/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //String nombre = '';
    //final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    final movieProvider = Provider.of<MoviesProvider>(context, listen: true);
    print(movieProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 20,
      ),
        body: SingleChildScrollView(
          child: Column(
          children: [
            CardSwiper(movies: movieProvider.onDisplayMovies),
            MovieSlider(movies: movieProvider.popularMovies, onNextPage:() => movieProvider.getPopularMovies()),
            ],
          ),
        ) 
      );
  }
}