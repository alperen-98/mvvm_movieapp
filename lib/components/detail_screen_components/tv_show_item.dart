import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/helpers/networking/network_data.dart';
import 'package:movie_app/screens/tv_show_detail_screen.dart';
import 'package:movie_app/widgets/error_widgets/poster_error_widget.dart';

class TvShowItem extends StatelessWidget {
  const TvShowItem({
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
