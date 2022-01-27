import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/constants/textstyles.dart';
import 'package:movie_app/data/response/api_response.dart';
import 'package:movie_app/model/movie/latest_movie.dart';
import 'package:movie_app/view/movie_detail_screen.dart';
import 'package:movie_app/view/widgets/buttons/watch_button.dart';
import 'package:movie_app/view/widgets/error_widgets/page_error_widget.dart';
import 'package:movie_app/view/widgets/error_widgets/poster_error_widget.dart';
import 'package:movie_app/view_model/movie_view_model.dart';
import 'package:provider/src/provider.dart';

import '../loading_indicator.dart';

class LatestContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiResponse>(
      future: context.read<MovieViewModel>().fetchLatestMovie(),
      builder: (context, snapshot) {
        ApiResponse? apiResponse = snapshot.data;
        LatestMovie? latestContent = apiResponse?.data as LatestMovie?;
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingIndicator();
        else if (snapshot.hasError)
          return PageErrorWidget();
        else {
          return _LatestContentInfo(
            id: latestContent!.id,
            name: latestContent.originalTitle,
            imageUrl: latestContent.backdropImageUrl,
          );
        }
      },
    );
  }
}

class _LatestContentInfo extends StatelessWidget {
  const _LatestContentInfo({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
  final int id;
  final String? name;
  final String? imageUrl;
  final double containerHeight = 342.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: containerHeight,
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            errorWidget: (context, url, error) => PosterErrorWidget(),
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
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
                          name ?? '',
                          style: kTitleTextStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
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
