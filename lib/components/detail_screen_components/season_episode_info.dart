import 'package:flutter/material.dart';
import 'package:movie_app/constants/textstyles.dart';

class SeasonEpisodeInfo extends StatelessWidget {
  const SeasonEpisodeInfo({
    required this.season,
    required this.episodes,
  });
  final int season;
  final int episodes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Seasons'),
            const SizedBox(height: 6),
            Text('$season', style: kTitleTextStyle),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('Total Episodes'),
            const SizedBox(height: 6),
            Text(
              '$episodes',
              style: kTitleTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
