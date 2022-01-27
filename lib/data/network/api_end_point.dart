import 'package:flutter_config/flutter_config.dart';

class ApiEndPoints {
  static final String API_KEY = 'api_key=' + FlutterConfig.get('API_KEY');
  static final String language = '&language=en-US';
  static final String contentType = 'popular?';
  static final String movie = 'movie/';
  static final String tvShow = 'tv/';

  final String getPopularMovies = "$movie${contentType}$API_KEY$language&page=";
  final String getPopularTvShow =
      "$tvShow${contentType}$API_KEY$language&page=";

  final String getMovieById = '$movie?$API_KEY$language';
  final String getTvShowById = '$tvShow?$API_KEY$language';

  final String getLatestMovie = '${movie}latest?$API_KEY$language';
}
