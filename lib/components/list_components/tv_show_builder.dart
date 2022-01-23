import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/helpers/networking/network_data.dart';
import 'package:movie_app/providers/tv_show_provider.dart';
import 'package:movie_app/screens/tv_show_detail_screen.dart';
import 'package:movie_app/widgets/error_widgets/list_error_widget.dart';
import 'package:movie_app/widgets/error_widgets/poster_error_widget.dart';
import 'package:movie_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class TvShowBuilder extends StatelessWidget {
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
              return _TvShowItem(
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

class _TvShowItem extends StatelessWidget {
  const _TvShowItem({
    required this.showId,
    required this.showPosterPath,
  });
  final int showId;
  final String? showPosterPath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => TvShowDetailScreen(id: showId),
        );
      },
      child: Container(
        width: 150,
        margin: kHorizontalListMargin,
        decoration: const BoxDecoration(
          color: kPosterContainerColor,
          borderRadius: kPosterBorderRadius,
        ),
        child: ClipRRect(
          borderRadius: kPosterBorderRadius,
          child: CachedNetworkImage(
            imageUrl: '${NetworkData.imageUrl}${showPosterPath}',
            errorWidget: (context, url, error) => PosterErrorWidget(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
