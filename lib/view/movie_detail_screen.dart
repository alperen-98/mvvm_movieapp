import 'package:flutter/material.dart';
import 'package:movie_app/data/response/api_response.dart';
import 'package:movie_app/model/movie/movie_detail.dart';
import 'package:movie_app/view/widgets/detail_screen_components/movie_detail_content.dart';
import 'package:movie_app/view/widgets/error_widgets/page_error_widget.dart';
import 'package:movie_app/view/widgets/loading_indicator.dart';
import 'package:movie_app/view_model/movie_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: FutureBuilder<ApiResponse>(
          future: context.watch<MovieViewModel>().fetchMovieById(id.toString()),
          builder: (context, snapshot) {
            ApiResponse? apiResponse = snapshot.data;
            MovieDetail? detail = apiResponse?.data as MovieDetail?;
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            else if (snapshot.hasError)
              return PageErrorWidget();
            else {
              return MovieDetailContent(
                imageUrl: detail?.backdropImageUrl ?? '',
                overview: detail?.overview ?? '',
                releaseDate: detail?.releaseDate ?? '',
                vote: detail?.voteAverage ?? 0.0,
                title: detail?.title ?? '',
              );
            }
          },
        ),
      ),
    );
  }
}
