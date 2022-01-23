class Movie {
  const Movie({
    this.adult,
    required this.backdropPath,
    this.genreIds,
    required this.id,
    this.originalLanguage,
    this.originalTitle,
    required this.overview,
    this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    this.video,
    required this.voteAverage,
    this.voteCount,
  });

  final bool? adult;
  final String? backdropPath; // nullable
  final List<int>? genreIds;
  final int id;
  final String? originalLanguage;
  final String? originalTitle;
  final String overview;
  final double? popularity;
  final String? posterPath; // nullable
  final DateTime releaseDate;
  final String title;
  final bool? video;
  final double voteAverage;
  final int? voteCount;

  factory Movie.fromJson(Map<dynamic, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((id) => id)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
}
