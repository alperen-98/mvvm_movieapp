import 'package:flutter/material.dart';
import 'package:movie_app/components/list_components/horizontal_movie_list.dart';
import 'package:movie_app/components/list_components/horizontal_tvshow_list.dart';
import 'package:movie_app/components/latest_content.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/widgets/error_widgets/list_error_widget.dart';
import 'package:movie_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/providers/tv_show_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: kMainColumnBottomPadding,
            child: Column(
              children: [
                // latest movie
                LatestContent(),

                const SizedBox(height: 20),

                // popular tv shows
                Consumer<TvShowProvider>(
                  builder: (context, provider, _) {
                    if (provider.tvShowState == TvShowState.OK) {
                      return HorizontalTvShowList(
                        title: 'Popular TV Shows',
                        list: provider.tvShows,
                      );
                    } else if (provider.tvShowState == TvShowState.LOADING) {
                      return LoadingIndicator();
                    } else
                      return ListErrorWidget();
                  },
                ),

                // popular movies
                Consumer<MovieProvider>(
                  builder: (context, provider, _) {
                    if (provider.movieState == MovieState.OK) {
                      return HorizontalMovieList(
                        title: 'Popular Movies',
                        movieList: provider.movies,
                      );
                    } else if (provider.movieState == MovieState.LOADING) {
                      return LoadingIndicator();
                    } else
                      return ListErrorWidget();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
