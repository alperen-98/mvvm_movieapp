import 'package:flutter/cupertino.dart';
import 'package:movie_app/components/detail_screen_components/tv_show_item.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/constants/textstyles.dart';
import 'package:movie_app/providers/tv_show_provider.dart';
import 'package:movie_app/widgets/error_widgets/list_error_widget.dart';
import 'package:movie_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class HorizontalTvShowList extends StatelessWidget {
  const HorizontalTvShowList({
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kMainColumnBottomPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: kHorizontalListMargin,
            child: Text(title, style: kHorizontalListTitleStyle),
          ),
          const SizedBox(height: 15),
          Container(
            height: 225,
            child: _TvShowBuilder(),
          ),
        ],
      ),
    );
  }
}

class _TvShowBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TvShowProvider>(
      builder: (context, provider, _) {
        if (provider.tvShowState == TvShowState.OK) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.listCount,
            itemBuilder: (ctx, i) {
              // fetch more tv shows before user comes to an end
              if (i + 3 == provider.listCount) {
                provider.fetchMoreTvShows();
              }
              final show = provider.tvShowList.tvShows[i];
              return TvShowItem(
                showId: show.id,
                showPosterPath: show.posterPath,
              );
            },
          );
        } else if (provider.tvShowState == TvShowState.LOADING) {
          return LoadingIndicator();
        } else
          return ListErrorWidget();
      },
    );
  }
}
