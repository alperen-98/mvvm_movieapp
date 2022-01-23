import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/decoration.dart';
import 'package:movie_app/helpers/networking/network_data.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';
import 'package:movie_app/widgets/error_widgets/list_error_widget.dart';
import 'package:movie_app/widgets/error_widgets/poster_error_widget.dart';
import 'package:movie_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class MovieBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, provider, _) {
        if (provider.movieState == MovieState.OK) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.movieListCount,
            itemBuilder: (ctx, i) {
              // fetch more movies before user comes to an end
              if (i + 3 == provider.movieListCount) {
                provider.fetchMoreMovies();
              }
              final movie = provider.movieList.movies[i];
              return _MovieItem(
                movieId: movie.id,
                moviePosterPath: movie.posterPath,
              );
            },
          );
        } else if (provider.movieState == MovieState.LOADING) {
          return LoadingIndicator();
        } else
          return ListErrorWidget();
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({
    required this.movieId,
    required this.moviePosterPath,
  });
  final int movieId;
  final String? moviePosterPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => MovieDetailScreen(id: movieId),
        );
      },
      child: Container(
        width: 150,
        margin: kHorizontalListMargin,
        decoration: BoxDecoration(
          color: kPosterContainerColor,
          borderRadius: kPosterBorderRadius,
        ),
        child: ClipRRect(
          borderRadius: kPosterBorderRadius,
          child: CachedNetworkImage(
            imageUrl: '${NetworkData.imageUrl}${moviePosterPath}',
            errorWidget: (context, url, error) => PosterErrorWidget(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
