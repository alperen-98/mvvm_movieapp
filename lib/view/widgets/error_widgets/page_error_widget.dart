import 'package:flutter/cupertino.dart';
import 'package:movie_app/constants/textstyles.dart';

class PageErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'An error occurred.',
            style: kTitleTextStyle,
          ),
          const SizedBox(height: 15),
          CupertinoButton(
            color: CupertinoColors.destructiveRed,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
