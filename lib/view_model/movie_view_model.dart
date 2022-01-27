import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/response/api_response.dart';
import 'package:movie_app/model/movie/movie_list.dart';
import 'package:movie_app/repository/movie_repository.dart';

class MovieViewModel with ChangeNotifier {
  late ApiResponse _apiResponse;

  MovieList? _movieList;
  int _pageNumber = 1;

  MovieViewModel() {
    fetchMovieData(_pageNumber.toString());
  }
  ApiResponse get response => _apiResponse;

  MovieList? get movieList => _movieList;

  Future<void> fetchMovieData(String page) async {
    _apiResponse = ApiResponse.loading('Fetching movie data');
    notifyListeners();
    try {
      _movieList = await MovieRepository().fetchMovieList('1');
      _apiResponse = ApiResponse.completed(_movieList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  Future<ApiResponse> fetchMovieById(String id) async {
    ApiResponse response = ApiResponse.loading('Fetching detail');
    try {
      var detail = await MovieRepository().fetchMovieDetail(id);
      response = ApiResponse.completed(detail);
    } catch (e) {
      response = ApiResponse.error(e.toString());
    }
    return response;
  }

  Future<ApiResponse> fetchLatestMovie() async {
    ApiResponse response = ApiResponse.loading('Fetching latest');
    try {
      var movie = await MovieRepository().fetchLatestMovie();
      response = ApiResponse.completed(movie);
    } catch (e) {
      print(e);
      response = ApiResponse.error(e.toString());
    }
    return response;
  }

  Future<void> fetchMoreMovie() async {
    if (_pageNumber <= 500) {
      try {
        _apiResponse = ApiResponse.loading('Fetching movie data');
        _pageNumber++;
        final newMovies =
            await MovieRepository().fetchMovieList(_pageNumber.toString());
        _movieList!.page = newMovies.page;
        newMovies.movies.forEach((movie) {
          _movieList!.movies.add(movie);
          _apiResponse = ApiResponse.completed(_movieList);
        });
        notifyListeners();
      } catch (e) {
        _apiResponse = ApiResponse.error(e.toString());
        _pageNumber--;
        print(e);
      }
    }
  }
}
