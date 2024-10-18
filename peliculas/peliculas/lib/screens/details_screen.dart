import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/casting_cards.dart';


class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Result movie = ModalRoute.of(context)!.settings.arguments as Result;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie),
        SliverList(delegate: SliverChildListDelegate(
          [
            _PosterAndTitle(movie),
            _Overview(movie),
            CastingCards(movieId: movie.id)
          ]
          ))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Result movie;
  const _CustomAppBar(this.movie);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: Text(
              movie.title,
              style: TextStyle(fontSize: 16, color: Colors.white),
            )),
        background: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/no-image.png'),
            image: NetworkImage(
                movie.fullBackdropPath)),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Result movie;
  const _PosterAndTitle(this.movie);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.png'),
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
            ),
          ),
          SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Icon(Icons.star_outline),
                    SizedBox(width: 5),
                    Text(movie.title)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
class _Overview extends StatelessWidget {
  final Result movie;
  const _Overview(this.movie);
  //final textTheme = Theme.of(context).textTheme.subtitle1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(movie.overview, textAlign: TextAlign.center,),
    );
      }
}