import 'package:flutter/material.dart';
import 'package:peliculas/widgets/card_swiper.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 20,
      ),
        body: Column(
          children: [CardSwiper()],
        )
      );
  }
}