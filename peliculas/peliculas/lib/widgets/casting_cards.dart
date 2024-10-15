
import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      color: Colors.red,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
              return _CastCard();
            })
    );
  }
}

class _CastCard extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      color: Colors.green,
      child: Column(
        children: [ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(placeholder: AssetImage('assets/no-image.png'),
           image: NetworkImage('https://th.bing.com/th/id/R.d9b27dfdff5a2a8182304ed921f7fe67?rik=iH9rCXLTvhfxYg&pid=ImgRaw&r=0'), 
           width: 100, 
           height: 140,
           fit: BoxFit.cover,),
        ),
        SizedBox(height: 5),
        Text('Nombre', maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}