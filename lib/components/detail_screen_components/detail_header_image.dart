import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/helpers/networking/network_data.dart';
import 'package:movie_app/widgets/buttons/circular_exit_button.dart';
import 'package:movie_app/widgets/error_widgets/poster_error_widget.dart';

class DetailHeaderImage extends StatelessWidget {
  const DetailHeaderImage({required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 310,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: '${NetworkData.imageUrl}$path',
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
