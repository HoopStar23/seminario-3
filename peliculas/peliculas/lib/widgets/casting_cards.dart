import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/credit_response.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: movieProvider.getMoviesCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 150,
              child: CupertinoActivityIndicator()
          );
        }
        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) => _CastCard(cast[index])
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast act;
  const _CastCard(this.act);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.png'),
              image: NetworkImage(
                  act.fullProfileImg),
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(act.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
