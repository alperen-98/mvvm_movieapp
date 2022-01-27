import 'package:flutter/material.dart';
import 'package:movie_app/data/response/api_response.dart';
import 'package:movie_app/model/tv_show/tv_show_detail.dart';
import 'package:movie_app/view/widgets/detail_screen_components/tvshow_detail_content.dart';
import 'package:movie_app/view/widgets/error_widgets/page_error_widget.dart';
import 'package:movie_app/view/widgets/loading_indicator.dart';
import 'package:movie_app/view_model/tv_show_view_model.dart';
import 'package:provider/provider.dart';

class TvShowDetailScreen extends StatelessWidget {
  const TvShowDetailScreen({required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: FutureBuilder<ApiResponse>(
          future:
              context.read<TvShowViewModel>().fetchTvShowById(id.toString()),
          builder: (context, snapshot) {
            ApiResponse? apiResponse = snapshot.data;
            TvShowDetail? detail = apiResponse?.data as TvShowDetail?;
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            else if (snapshot.hasError)
              return PageErrorWidget();
            else {
              return TvShowDetailContent(
                showDetail: detail!,
              );
            }
          },
        ),
      ),
    );
  }
}
