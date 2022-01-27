import 'package:flutter/material.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/model/tv_show/tv_show_detail.dart';
import 'package:movie_app/view/widgets/detail_screen_components/season_episode_info.dart';
import 'date_info.dart';
import 'detail_header_image.dart';
import 'detail_info_tile.dart';
import 'movie_show_description.dart';

class TvShowDetailContent extends StatelessWidget {
  const TvShowDetailContent({required this.showDetail});
  final TvShowDetail showDetail;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DetailHeaderImage(
            urlToImage: showDetail.backdropImageUrl,
          ),
          Padding(
            padding: kDetailContentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailInfoTile(
                  title: showDetail.name,
                  category: 'Tv Series',
                  rate: showDetail.voteAverage.toDouble(),
                ),
                const SizedBox(height: 40),
                SeasonEpisodeInfo(
                  season: showDetail.numberOfSeasons,
                  episodes: showDetail.numberOfEpisodes,
                ),
                const SizedBox(height: 20),
                DateInfo(
                  title: 'First Air Date',
                  date: showDetail.firstAirDate.toString(),
                ),
                const SizedBox(height: 20),
                MovieShowDescription(
                  description: showDetail.overview,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
