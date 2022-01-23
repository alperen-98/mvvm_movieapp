import 'movie_result.dart';

class MovieList {
  MovieList({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> movies;
  final int totalPages;
  final int totalResults;

  factory MovieList.fromJson(Map<dynamic, dynamic> json) => MovieList(
        page: json["page"],
        movies: List<Movie>.from(
            json["results"].map((movie) => Movie.fromJson(movie))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
