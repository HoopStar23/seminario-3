import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/result.dart';

class CardSwiper extends StatelessWidget {

  final List<Result> movies;
  const CardSwiper({super.key,required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.56,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 500,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width *0.7,
        itemHeight: size.height * 0.6,
        itemBuilder: (_, int index){
          final movie = movies[index];
          return GestureDetector(
            child: ClipRRect(
            child: FadeInImage(
            placeholder: AssetImage('assets/no-image.png'), 
            image: NetworkImage(movie.fullPosterImg),
            fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          onTap: () => Navigator.pushNamed(context, 'details_screen', arguments: movie),
          ); 
        },),
    );
  }
}