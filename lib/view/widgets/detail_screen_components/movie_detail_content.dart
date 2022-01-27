import 'package:flutter/material.dart';
import 'package:movie_app/constants/decoration.dart';
import 'date_info.dart';
import 'detail_header_image.dart';
import 'detail_info_tile.dart';
import 'movie_show_description.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent(
      {required this.imageUrl,
      required this.title,
      required this.vote,
      required this.releaseDate,
      required this.overview});
  final String imageUrl;
  final String title;
  final double vote;
  final String releaseDate;
  final String overview;

  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    print(title);
    print(vote);
    print(releaseDate);
    print(overview);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DetailHeaderImage(urlToImage: imageUrl),
          Padding(
            padding: kDetailContentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailInfoTile(
                  title: title,
                  category: 'Movie',
                  rate: vote,
                ),
                const SizedBox(height: 40),
                DateInfo(
                  title: 'Release Date',
                  date: releaseDate,
                ),
                const SizedBox(height: 20),
                MovieShowDescription(
                  description: overview,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
