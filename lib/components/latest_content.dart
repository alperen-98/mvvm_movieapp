import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/textstyles.dart';
import 'package:movie_app/screens/tv_show_detail_screen.dart';
import 'package:movie_app/widgets/buttons/watch_button.dart';

class LatestContent extends StatelessWidget {
  final double containerHeight = 342.0;
  final url =
      "https://www.cumhuriyet.com.tr/Archive/2022/1/5/1897894/kapak_110030.jpg";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: containerHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => TvShowDetailScreen(),
            );
          },
          child: Container(
            height: containerHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 0),
                  Color.fromRGBO(0, 0, 0, 0.41),
                  Color(0xFF0D0D0D).withOpacity(0.8974),
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'After Life',
                          style: kTitleTextStyle,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        const SizedBox(height: 1),
                        Text('TV series', style: kDetailSubtitleTextStyle),
                        const SizedBox(height: 1),
                        const Text(
                          'Latest Content',
                          style: kLatestContentTextStyle,
                        ),
                      ],
                    ),
                  ),
                  WatchButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
