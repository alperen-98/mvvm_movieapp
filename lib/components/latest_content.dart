import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/constants/textstyles.dart';
import 'package:movie_app/helpers/networking/network_data.dart';
import 'package:movie_app/models/movie_model/latest_movie.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';
import 'package:movie_app/widgets/buttons/watch_button.dart';
import 'package:movie_app/widgets/error_widgets/poster_error_widget.dart';
import 'package:movie_app/widgets/loading_indicator.dart';
import 'package:provider/src/provider.dart';

class LatestContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatestMovie>(
        future: context.read<MovieProvider>().getLatestMovieContent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingIndicator();
          else if (snapshot.hasError)
            return PosterErrorWidget();
          else
            return _LatestContentInfo(
              id: snapshot.data!.id,
              name: snapshot.data!.title,
              imagePath: snapshot.data?.backdropPath,
            );
        });
  }
}

class _LatestContentInfo extends StatelessWidget {
  const _LatestContentInfo({
    required this.id,
    required this.name,
    required this.imagePath,
  });
  final int id;
  final String name;
  final String? imagePath;
  final double containerHeight = 342.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: containerHeight,
          child: CachedNetworkImage(
            imageUrl: '${NetworkData.imageUrl}${imagePath}',
            errorWidget: (context, url, error) => PosterErrorWidget(),
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            print(id);
            showCupertinoModalPopup(
              context: context,
              builder: (context) => MovieDetailScreen(id: id),
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
                          name,
                          style: kTitleTextStyle,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        const SizedBox(height: 1),
                        Text('Movie', style: kDetailSubtitleTextStyle),
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
