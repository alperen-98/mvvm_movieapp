import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view/widgets/buttons/circular_exit_button.dart';
import 'package:movie_app/view/widgets/error_widgets/poster_error_widget.dart';

class DetailHeaderImage extends StatelessWidget {
  const DetailHeaderImage({required this.urlToImage});
  final String? urlToImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 310,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: urlToImage ?? '',
            errorWidget: (context, url, error) => PosterErrorWidget(),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 43,
          right: 28,
          child: CircularExitButton(),
        ),
      ],
    );
  }
}
