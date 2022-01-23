import 'package:flutter/material.dart';
import 'package:movie_app/components/detail_screen_components/tvshow_detail_content.dart';
import 'package:movie_app/models/tv_show_model/tv_show_detail_model/tv_show_detail.dart';
import 'package:movie_app/providers/tv_show_provider.dart';
import 'package:movie_app/widgets/error_widgets/page_error_widget.dart';
import 'package:movie_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class TvShowDetailScreen extends StatelessWidget {
  const TvShowDetailScreen({required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: FutureBuilder<TvShowDetail>(
          future: context.read<TvShowProvider>().getTvShowById(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            else if (snapshot.hasError)
              return PageErrorWidget();
            else
              return TvShowDetailContent(
                showDetail: snapshot.data!,
              );
          },
        ),
      ),
    );
  }
}
