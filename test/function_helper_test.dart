import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/helpers/function_helper.dart';

void main() {
  test('Testing FunctionHelper functions', () {
    FunctionHelper functionHelper = FunctionHelper();
    rateRounderTest(functionHelper);
    borderColorTest(functionHelper);
    dateTest(functionHelper);
  });
}

void dateTest(FunctionHelper functions) {
  String date = functions.getFormattedDate('2022-01-28');
  expect(date, '28.1.2022');
}

void borderColorTest(FunctionHelper functions) {
  Color color1 = functions.getRateBorderColor(1.0);
  expect(color1, kRedColor);

  Color color2 = functions.getRateBorderColor(5.5);
  expect(color2, Colors.yellow);

  Color color3 = functions.getRateBorderColor(7.2);
  expect(color3, Colors.orange);

  Color color4 = functions.getRateBorderColor(9.1);
  expect(color4, kGreenColor);
}

void rateRounderTest(FunctionHelper functions) {
  String result1 = functions.getRoundedRate(9.0);
  expect(result1, '9');

  String result2 = functions.getRoundedRate(1.2);
  expect(result2, '1.2');

  String result3 = functions.getRoundedRate(0.6);
  expect(result3, '0.6');
}
