import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/decoration.dart';
import '../error_widgets/poster_error_widget.dart';

class PosterItem extends StatelessWidget {
  const PosterItem({required this.onPressed, required this.urlToImage});
  final Function() onPressed;
  final String urlToImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
            imageUrl: urlToImage,
            errorWidget: (context, url, error) => PosterErrorWidget(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
