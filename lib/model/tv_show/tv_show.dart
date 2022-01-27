import 'package:flutter_config/flutter_config.dart';

class TvShow {
  TvShow({
    required this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    required this.id,
    required this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    required this.overview,
    this.popularity,
    this.posterPath,
    required this.voteAverage,
    this.voteCount,
  });

  final String? backdropPath;
  final DateTime? firstAirDate;
  final List<int>? genreIds;
  final int id;
  final String name;
  List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String overview;
  final double? popularity;
  final String? posterPath;
  final double voteAverage;
  final int? voteCount;

  String get posterImageUrl => FlutterConfig.get('IMAGE_URL') + posterPath;

  String get backdropImageUrl => FlutterConfig.get('IMAGE_URL') + backdropPath;

  factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
        backdropPath: json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((id) => id)),
        id: json["id"],
        name: json["name"],
        originCountry:
            List<String>.from(json["origin_country"].map((country) => country)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
}
