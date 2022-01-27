import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/textstyles.dart';

class ListErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.error,
          size: 50,
          color: kRedColor,
        ),
        const SizedBox(height: 5),
        const Text('An error occurred while getting movies/tv shows',
            style: kDetailSubtitleTextStyle),
      ],
    );
  }
}
