import 'package:flutter/material.dart';
import 'package:movie_app/components/detail_screen_components/movie_detail_content.dart';
import 'package:movie_app/models/movie_model/movie_detail_model/movie_detail.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/widgets/error_widgets/page_error_widget.dart';
import 'package:movie_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: FutureBuilder<MovieDetail>(
          future: context.read<MovieProvider>().getMovieDetailsById(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            else if (snapshot.hasError)
              return PageErrorWidget();
            else {
              final movie = snapshot.data!;
              return MovieDetailContent(
                movieBackdropPath: movie.backdropPath ?? '',
                movieOverview: movie.overview ?? '',
                movieReleaseDate: movie.releaseDate ?? '',
                movieTitle: movie.title,
                movieVoteAvr: movie.voteAverage,
              );
            }
          },
        ),
      ),
    );
  }
}
