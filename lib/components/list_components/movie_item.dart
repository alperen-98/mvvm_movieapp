import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/helpers/networking/network_data.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';
import 'package:movie_app/widgets/error_widgets/poster_error_widget.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    required this.movieId,
    required this.moviePosterPath,
  });
  final int movieId;
  final String? moviePosterPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => MovieDetailScreen(id: movieId),
        );
      },
      child: Container(
        width: 150,
        margin: kHorizontalListMargin,
        decoration: BoxDecoration(
          color: kPosterContainerColor,
          borderRadius: kPosterBorderRadius,
        ),
        child: ClipRRect(
          borderRadius: kPosterBorderRadius,
          child: CachedNetworkImage(
            imageUrl: '${NetworkData.imageUrl}${moviePosterPath}',
            errorWidget: (context, url, error) => PosterErrorWidget(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
