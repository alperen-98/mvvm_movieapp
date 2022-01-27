import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/response/api_response.dart';
import 'package:movie_app/model/tv_show/tv_show_list.dart';
import 'package:movie_app/view/tv_show_detail_screen.dart';
import 'package:movie_app/view/widgets/error_widgets/list_error_widget.dart';
import 'package:movie_app/view/widgets/list_components/poster_item.dart';
import 'package:movie_app/view_model/tv_show_view_model.dart';
import 'package:provider/provider.dart';
import '../loading_indicator.dart';

class TvShowBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<TvShowViewModel>();
    final reader = context.read<TvShowViewModel>();
    ApiResponse apiResponse = watcher.response;
    TvShowList? tvShowList = apiResponse.data as TvShowList?;
    if (apiResponse.status == Status.LOADING)
      return LoadingIndicator();
    else if (apiResponse.status == Status.ERROR)
      return ListErrorWidget();
    else {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tvShowList!.tvShows.length,
        itemBuilder: (context, i) {
          final show = tvShowList.tvShows[i];
          if (i + 3 == watcher.tvShowList!.tvShows.length) {
            reader.fetchMoreTvShows();
          }
          return PosterItem(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => TvShowDetailScreen(id: show.id),
              );
            },
            urlToImage: show.posterImageUrl,
          );
        },
      );
    }
  }
}
