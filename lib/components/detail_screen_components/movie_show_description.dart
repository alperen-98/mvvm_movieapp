import 'package:flutter/material.dart';
import 'package:movie_app/constants/textstyles.dart';

class MovieShowDescription extends StatelessWidget {
  const MovieShowDescription({required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description', style: kDetailSubtitleTextStyle),
        const SizedBox(height: 6),
        Text(description, style: kDetailDescriptionTextStyle),
      ],
    );
  }
}
