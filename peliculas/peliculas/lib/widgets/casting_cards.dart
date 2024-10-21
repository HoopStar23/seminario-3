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
            itemCount: cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) => _CastCard(cast[index])
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;
  const _CastCard(this.cast);
  @override
  Widget build(BuildContext context) {
    cast.uniqueId = '${cast.id}-card';
    return GestureDetector(
      child: ClipRRect(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 110,
            height: 100,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(
                        cast.fullProfileImg),
                    width: 100,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                
                Text(cast.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center)
              ],
            ),
          ),
      ),
      onTap: () async{
        // Petición y guardamos en Cast
        final actor = await MoviesProvider().getActorDetails(cast.id);
        //si ha cargado, vamos a la siguiente pantalla y le pasamos la info del detalle completo del actor
        Navigator.pushNamed(context, 'actor_details_screen', arguments: actor);
      }
    );
  }
}
