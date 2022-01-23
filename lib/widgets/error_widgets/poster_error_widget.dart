import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';

class PosterErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error,
        size: 40,
        color: kRedColor,
      ),
    );
  }
}
