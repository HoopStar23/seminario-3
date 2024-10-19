import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Result> movies;
  final Function onNextPage;
  const MovieSlider(
      {super.key, required this.movies, required this.onNextPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = new ScrollController();

  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
          Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length,
                  itemBuilder: (context, index) {
                    return _MoviePoster(widget.movies[index]);
                  }))
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Result movie;
  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    movie.uniqueId = '${movie.id}-poster';
    return Container(
      width: 120,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            child: ClipRRect(
              child: Hero(
                tag: movie.uniqueId!,
                child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.png'),
                    image: NetworkImage(movie.fullPosterImg)),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            onTap: () => Navigator.pushNamed(context, 'details_screen', arguments: movie),
          ),
          SizedBox(height: 5),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
