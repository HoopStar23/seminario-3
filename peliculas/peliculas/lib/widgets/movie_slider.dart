import 'package:flutter/material.dart';


class MovieSlider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
          Expanded(child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index){
              return _MoviePoster();
            }))
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(child: ClipRRect(child: 
            FadeInImage(placeholder: AssetImage('assets/no-image.png'), 
              image: NetworkImage('https://th.bing.com/th/id/R.d9b27dfdff5a2a8182304ed921f7fe67?rik=iH9rCXLTvhfxYg&pid=ImgRaw&r=0')),
              borderRadius: BorderRadius.circular(20),
              ),
              onTap: () => Navigator.pushNamed(context, 'details_screen'),
            ) ,
          SizedBox(height: 5,),
          Text('Mundo mundi', maxLines: 2,overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}