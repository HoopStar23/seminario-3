import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  String get searchFieldLabel => 'Buscar Pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = '', icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null), 
        icon: Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);
    movieProvider.getSuggestionsByQuery(query);
    return StreamBuilder(
        stream: movieProvider.suggestionStream,
        builder: (_, AsyncSnapshot<List<Result>> snapshot) {
          if (snapshot.hasData) {
            final movies = snapshot.data!;
            return ListView.builder(
                itemCount: movies.length,
                itemBuilder: ((context, index) => _MovieItem(movies[index])));
          } else {
            return _emptyContainer();
          }
        });
  }
}

class _MovieItem extends StatelessWidget {
  final Result movie;
  const _MovieItem(this.movie);
  @override
  Widget build(BuildContext context) {
    movie.uniqueId = '${movie.id}-search';
    return SizedBox(
      height: 70,
      width: 100,
      child: ListTile(
        leading: Hero(
          tag: movie.uniqueId!,
          child: FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage(movie.fullPosterImg),
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(movie.title),
        subtitle: Text(movie.originalTitle),
        onTap: () {
          Navigator.pushNamed(context, 'details_screen', arguments: movie);
        },
      ),
    );
  }
}

class _emptyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.movie_creation_outlined,
            color: Colors.black38, size: 130),
      ),
    );
  }
}
