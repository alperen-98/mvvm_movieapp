import 'package:flutter/cupertino.dart';
import 'package:movie_app/components/detail_screen_components/tv_show_item.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/constants/textstyles.dart';
import 'package:movie_app/models/tv_show_model/tv_show_list.dart';

class HorizontalTvShowList extends StatelessWidget {
  const HorizontalTvShowList({
    required this.title,
    required this.list,
  });
  final String title;
  final TvShowList list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: kHorizontalListMargin,
          child: Text(title, style: kHorizontalListTitleStyle),
        ),
        const SizedBox(height: 15),
        Container(
          height: 225,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (ctx, i) {
              final show = list.tvShows[i];
              return TvShowItem(
                showId: show.id,
                showPosterPath: show.posterPath,
              );
            },
          ),
        ),
      ],
    );
  }
}
