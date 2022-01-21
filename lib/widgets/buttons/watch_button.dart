import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/textstyles.dart';

class WatchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //
      },
      child: Text('Watch', style: kWatchButtonTextStyle),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kGreenColor),
        fixedSize: MaterialStateProperty.all(Size.fromWidth(90)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ),
    );
  }
}
