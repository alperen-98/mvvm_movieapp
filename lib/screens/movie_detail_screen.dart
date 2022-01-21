import 'package:flutter/material.dart';
import 'package:movie_app/components/detail_screen_components/date_info.dart';
import 'package:movie_app/components/detail_screen_components/detail_header_image.dart';
import 'package:movie_app/components/detail_screen_components/movie_show_description.dart';
import 'package:movie_app/components/detail_screen_components/rate_info.dart';

class MovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DetailHeaderImage(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RateInfo(title: 'Ragnarok', category: 'Movie', rate: 9.4),
                    const SizedBox(height: 40),
                    DateInfo(title: 'Release Date', date: '07.10.2014'),
                    const SizedBox(height: 20),
                    MovieShowDescription(
                        description:
                            "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only \"meta-human\" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
