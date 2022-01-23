import 'package:movie_app/constants/colors.dart';
import 'package:flutter/material.dart';

class FunctionHelper {
  String getFormattedDate(String? givenDate) {
    try {
      var date = DateTime.parse(givenDate!);
      String day = date.day.toString();
      String month = date.month.toString();
      String year = date.year.toString();
      return day + '.' + month + '.' + year;
    } catch (exception) {
      return '';
    }
  }

  // 10.0 would overflow the circle and 9.0 or 7.0 wouldn't look good
  // so i removed .0
  String getRoundedRate(double rate) {
    if (rate.toString().contains('.0')) {
      return rate.toString().replaceAll('.0', '');
    }
    return rate.toString();
  }

  Color getRateBorderColor(double rate) {
    if (rate < 4) {
      return kRedColor;
    } else if (rate < 6) {
      return Colors.yellow;
    } else if (rate < 8) {
      return Colors.orange;
    } else {
      return kGreenColor;
    }
  }
}
