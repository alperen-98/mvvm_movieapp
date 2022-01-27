import 'package:flutter/material.dart';
import 'package:movie_app/constants/textstyles.dart';
import 'package:movie_app/helpers/function_helper.dart';

class DateInfo extends StatelessWidget {
  const DateInfo({required this.title, required this.date});
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: kDetailSubtitleTextStyle),
        const SizedBox(height: 6),
        Text(FunctionHelper().getFormattedDate(date), style: kTitleTextStyle),
      ],
    );
  }
}
