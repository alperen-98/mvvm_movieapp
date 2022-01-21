import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/textstyles.dart';
import 'package:movie_app/widgets/buttons/watch_button.dart';

class RateInfo extends StatelessWidget {
  const RateInfo({
    required this.title,
    required this.category,
    required this.rate,
  });
  final String title;
  final String category;
  final double rate;

  Color get RateBorderColor {
    if (rate < 4) {
      return kRedColor;
    } else if (rate < 6) {
      return Colors.orange;
    } else {
      return kGreenColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 11,
      leading: Container(
        width: 35,
        height: 35,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: RateBorderColor,
          ),
        ),
        child: Center(
          child: Text(
            '$rate',
            style: kRateTextStyle,
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: Text(category),
      trailing: WatchButton(),
    );
  }
}

/*
leading: Container(
        height: 100,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: getRateBorderColor(),
          ),
        ),
        child: Text('$rate', style: kRateTextStyle),
      ),
 */
