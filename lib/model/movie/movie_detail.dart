import 'package:flutter_config/flutter_config.dart';

class MovieDetail {
  const MovieDetail({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  final String? backdropPath;
  final int id;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final double voteAverage;

  String get backdropImageUrl => FlutterConfig.get('IMAGE_URL') + backdropPath;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
