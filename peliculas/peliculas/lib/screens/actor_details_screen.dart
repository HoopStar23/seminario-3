import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/actor_response.dart';
import 'package:peliculas/models/credit_response.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class ActorDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cast cast = ModalRoute.of(context)!.settings.arguments as Cast;
    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);

    return Scaffold(
      body: FutureBuilder(
        future: movieProvider.getActorDetails(cast.id),
        builder: (_, AsyncSnapshot<ActorResponse> snapshot) {
          if (!snapshot.hasData) {
          return Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 150,
              child: CupertinoActivityIndicator(),
          );
        }
          final ActorResponse actor = snapshot.data!;

          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  ClipRect(
                    child: Hero(
                      tag: cast.uniqueId!,
                      child: CastImage(actor: actor),
                    ),
                  ),
                  _Description(actor),
                ]),
              )
            ],
          );
        },
      ),
    );
  }
}

class CastImage extends StatelessWidget {
  final ActorResponse actor;
  const CastImage({super.key,required this.actor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 90),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.png'),
          image: NetworkImage(
              actor.fullActorImg),
          height: 350,
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final ActorResponse actor;
  const _Description(this.actor);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(actor.name,textAlign: TextAlign.center,),
          SizedBox(height: 20),
          Text('Birthday ${actor.birthday}',textAlign: TextAlign.center,),
          SizedBox(height: 20),
          Text('Place of Birth ${actor.placeOfBirth}',textAlign: TextAlign.center,),
          SizedBox(height: 20),
          Text('Bio ${actor.biography}',textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
