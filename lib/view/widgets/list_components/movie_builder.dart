import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/response/api_response.dart';
import 'package:movie_app/model/movie/movie_list.dart';
import 'package:movie_app/view/movie_detail_screen.dart';
import 'package:movie_app/view/widgets/error_widgets/list_error_widget.dart';
import 'package:movie_app/view/widgets/list_components/poster_item.dart';
import 'package:movie_app/view_model/movie_view_model.dart';
import 'package:provider/provider.dart';

import '../loading_indicator.dart';

class MovieBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<MovieViewModel>();
    final reader = context.read<MovieViewModel>();
    ApiResponse apiResponse = watcher.response;
    MovieList? movieList = apiResponse.data as MovieList?;
    if (apiResponse.status == Status.LOADING)
      return LoadingIndicator();
    else if (apiResponse.status == Status.ERROR)
      return ListErrorWidget();
    else {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList!.movies.length,
        itemBuilder: (context, i) {
          final movie = movieList.movies[i];
          if (i + 3 == watcher.movieList!.movies.length) {
            reader.fetchMoreMovie();
          }
          return PosterItem(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => MovieDetailScreen(
                  id: movie.id,
                ),
              );
            },
            urlToImage: movie.posterImageUrl,
          );
        },
      );
    }
  }
}
