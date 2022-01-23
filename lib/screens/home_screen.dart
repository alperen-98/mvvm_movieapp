import 'package:flutter/material.dart';
import 'package:movie_app/components/list_components/horizontal_movie_list.dart';
import 'package:movie_app/components/list_components/horizontal_tvshow_list.dart';
import 'package:movie_app/components/latest_content.dart';
import 'package:movie_app/constants/decoration.dart';

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
                HorizontalTvShowList(title: 'Popular TV Shows'),

                // popular movies
                HorizontalMovieList(
                  title: 'Popular Movies',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
