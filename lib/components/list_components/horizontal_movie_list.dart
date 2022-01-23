import 'package:flutter/cupertino.dart';
import 'package:movie_app/components/list_components/movie_item.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/constants/textstyles.dart';
import 'package:movie_app/models/movie_model/movie_list.dart';

class HorizontalMovieList extends StatelessWidget {
  const HorizontalMovieList({
    required this.title,
    required this.movieList,
  });
  final String title;
  final MovieList movieList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: kHorizontalListMargin,
          child: Text(title, style: kHorizontalListTitleStyle),
        ),
        const SizedBox(height: 15),
        Container(
          height: 225,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (ctx, i) {
              final movie = movieList.movies[i];
              return MovieItem(
                movieId: movie.id,
                moviePosterPath: movie.posterPath,
              );
            },
          ),
        ),
      ],
    );
  }
}
