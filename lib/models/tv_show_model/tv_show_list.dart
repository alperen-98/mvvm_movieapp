import 'package:movie_app/models/tv_show_model/tv_show.dart';

class TvShowList {
  TvShowList({
    required this.page,
    required this.tvShows,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<TvShow> tvShows;
  final int totalPages;
  final int totalResults;

  factory TvShowList.fromJson(Map<String, dynamic> json) => TvShowList(
        page: json["page"],
        tvShows: List<TvShow>.from(
            json["results"].map((show) => TvShow.fromJson(show))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
