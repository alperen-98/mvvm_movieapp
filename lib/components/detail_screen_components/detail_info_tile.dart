import 'package:flutter/material.dart';
import 'package:movie_app/constants/textstyles.dart';
import 'package:movie_app/helpers/function_helper.dart';
import 'package:movie_app/widgets/buttons/watch_button.dart';

class DetailInfoTile extends StatelessWidget {
  const DetailInfoTile({
    required this.title,
    required this.category,
    required this.rate,
  });
  final String title;
  final String category;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 11,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 35,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: FunctionHelper().getRateBorderColor(rate),
          ),
        ),
        child: Center(
          child: Text(
            FunctionHelper().getRoundedRate(rate),
            style: kRateTextStyle,
          ),
        ),
      ),
      title: Text(title, style: kTitleTextStyle),
      subtitle: Text(category, style: kDetailSubtitleTextStyle),
      trailing: WatchButton(),
    );
  }
}
