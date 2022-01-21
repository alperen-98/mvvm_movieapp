import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';

class CircularExitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kExitButtonBackgroundColor,
        ),
        padding: const EdgeInsets.all(5),
        child: const Icon(
          Icons.close,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
