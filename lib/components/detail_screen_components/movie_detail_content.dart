import 'package:flutter/material.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/helpers/function_helper.dart';
import 'date_info.dart';
import 'detail_header_image.dart';
import 'detail_info_tile.dart';
import 'movie_show_description.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    required this.movieBackdropPath,
    required this.movieTitle,
    required this.movieOverview,
    required this.movieReleaseDate,
    required this.movieVoteAvr,
  });
  final String movieBackdropPath;
  final String movieTitle;
  final double movieVoteAvr;
  final String movieReleaseDate;
  final String movieOverview;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DetailHeaderImage(path: movieBackdropPath),
          Padding(
            padding: kDetailContentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailInfoTile(
                  title: movieTitle,
                  category: 'Movie',
                  rate: movieVoteAvr,
                ),
                const SizedBox(height: 40),
                DateInfo(
                  title: 'Release Date',
                  date: FunctionHelper().getFormattedDate(
                    movieReleaseDate.toString(),
                  ),
                ),
                const SizedBox(height: 20),
                MovieShowDescription(
                  description: movieOverview,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
