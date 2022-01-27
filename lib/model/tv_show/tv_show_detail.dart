import 'package:flutter_config/flutter_config.dart';

class TvShowDetail {
  const TvShowDetail({
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.firstAirDate,
  });
  final String? backdropPath;
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final num voteAverage;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final DateTime firstAirDate;

  String get backdropImageUrl => FlutterConfig.get('IMAGE_URL') + backdropPath;

  factory TvShowDetail.fromJson(Map<String, dynamic> json) => TvShowDetail(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        firstAirDate: DateTime.parse(json['first_air_date']),
      );
}
