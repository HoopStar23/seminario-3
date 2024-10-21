import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/actor_response.dart';
import 'package:peliculas/models/credit_response.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class ActorDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cast = ModalRoute.of(context)?.settings.arguments as ActorResponse?;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            ClipRect(
              child: CastImage(actor: cast!),
            ),
            _Description(cast),
          ]),
        )
      ],
    ));
  }
}

class CastImage extends StatelessWidget {
  final ActorResponse actor;
  const CastImage({super.key, required this.actor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 90),
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage(actor.fullActorImg),
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
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
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Column(
        children: [
          Text(
            actor.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Birthday: ${actor.birthday.toString().substring(0,10)}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Place of Birth: ${actor.placeOfBirth}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Bio: ${actor.biography}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
