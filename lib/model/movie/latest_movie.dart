import 'package:flutter_config/flutter_config.dart';

class LatestMovie {
  LatestMovie({
    required this.backdropPath,
    required this.id,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    required this.title,
    this.voteAverage,
  });

  final String? backdropPath;
  final int id;
  final String? originalTitle;
  final String? overview;
  final String? releaseDate;
  final String title;
  final double? voteAverage;

  String? get backdropImageUrl => FlutterConfig.get('IMAGE_URL') + backdropPath;

  factory LatestMovie.fromJson(Map<String, dynamic> json) => LatestMovie(
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
