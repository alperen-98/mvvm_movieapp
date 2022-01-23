import 'package:flutter/cupertino.dart';
import 'package:movie_app/components/list_components/movie_item.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/constants/textstyles.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/widgets/error_widgets/list_error_widget.dart';
import 'package:movie_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class HorizontalMovieList extends StatelessWidget {
  const HorizontalMovieList({
    required this.title,
  });
  final String title;

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
          child: _MovieBuilder(),
        ),
      ],
    );
  }
}

class _MovieBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, provider, _) {
        if (provider.movieState == MovieState.OK) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.movieListCount,
            itemBuilder: (ctx, i) {
              final movie = provider.movieList.movies[i];
              return MovieItem(
                movieId: movie.id,
                moviePosterPath: movie.posterPath,
              );
            },
          );
        } else if (provider.movieState == MovieState.LOADING) {
          return LoadingIndicator();
        } else
          return ListErrorWidget();
      },
    );
  }
}
