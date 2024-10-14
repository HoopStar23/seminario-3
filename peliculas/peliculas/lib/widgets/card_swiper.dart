import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 500,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width *0.7,
        itemHeight: size.height * 0.6,
        itemBuilder: (_, int index){
          return GestureDetector(
            child: ClipRRect(
            child: FadeInImage(
            placeholder: AssetImage('assets/no-image.png'), 
            image: NetworkImage('https://th.bing.com/th/id/R.d9b27dfdff5a2a8182304ed921f7fe67?rik=iH9rCXLTvhfxYg&pid=ImgRaw&r=0'),
            fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          onTap: () => Navigator.pushNamed(context, 'details_screen'),
          ); 
        },),
    );
  }
}