import 'package:flutter/material.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/constants/textstyles.dart';

class HorizontalListBuilder extends StatelessWidget {
  const HorizontalListBuilder({
    required this.title,
    required this.listBuilder,
  });
  final String title;
  final Widget listBuilder;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: kHorizontalListMargin,
          child: Text(title, style: kHorizontalListTitleStyle),
        ),
        const SizedBox(height: 15),
        Container(
          height: 225,
          child: listBuilder,
        ),
      ],
    );
  }
}
