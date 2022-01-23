import 'package:flutter/material.dart';
import 'package:movie_app/components/list_components/horizontal_list_builder.dart';
import 'package:movie_app/components/latest_content/latest_content.dart';
import 'package:movie_app/components/list_components/movie_builder.dart';
import 'package:movie_app/components/list_components/tv_show_builder.dart';
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
                HorizontalListBuilder(
                  title: 'Popular TV Shows',
                  listBuilder: TvShowBuilder(),
                ),

                // popular movies
                HorizontalListBuilder(
                  title: 'Popular Movies',
                  listBuilder: MovieBuilder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
