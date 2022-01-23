import 'package:flutter/cupertino.dart';
import 'package:movie_app/helpers/networking/network_data.dart';
import 'package:movie_app/helpers/networking/network_helper.dart';
import 'package:movie_app/models/movie_model/latest_movie.dart';
import 'package:movie_app/models/movie_model/movie_detail_model/movie_detail.dart';
import 'package:movie_app/models/movie_model/movie_list.dart';

enum MovieState { OK, LOADING, ERROR }

class MovieProvider with ChangeNotifier {
  late MovieList _movieList;

  MovieList get movieList => _movieList;

  int get movieListCount => _movieList.movies.length;

  MovieProvider() {
    fetchMovies();
  }

  late MovieState _movieState;

  MovieState get movieState => _movieState;

  set movieState(MovieState state) {
    _movieState = state;
    notifyListeners();
  }

  int _pageNumber = 1;

  int get pageNumber => _pageNumber;

  void incrementPageNumber() {
    _pageNumber++;
  }

  Future<void> fetchMovies() async {
    final url =
        '${NetworkData.MovieDbUrl}movie/popular?api_key=${NetworkData.ApiKey}&language=en-US&page=1';
    try {
      movieState = MovieState.LOADING;
      var fetchedMovies = await NetworkHelper().getData(url);
      _movieList = MovieList.fromJson(fetchedMovies);
      movieState = MovieState.OK;
      notifyListeners();
    } catch (Exception) {
      movieState = MovieState.ERROR;
    }
  }

  Future<void> fetchMoreMovies() async {
    // it should be => pageNumber < _movieList.totalPages
    // however the api only allows up to 500th number
    if (pageNumber < 500) {
      print('more movies are coming');
      try {
        incrementPageNumber();
        final url =
            "${NetworkData.MovieDbUrl}movie/popular?api_key=${NetworkData.ApiKey}&language=en-US&page=$pageNumber";
        var data = await NetworkHelper().getData(url);
        var newMovieList = MovieList.fromJson(data);
        _movieList.page = newMovieList.page;
        newMovieList.movies.forEach((movie) {
          _movieList.movies.add(movie);
        });
        print('new length = ${movieListCount}');
        notifyListeners();
      } catch (exception) {
        throw 'Error';
      }
    }
  }

  Future<MovieDetail> getMovieDetailsById(int id) async {
    final url =
        "${NetworkData.MovieDbUrl}movie/$id?api_key=${NetworkData.ApiKey}&language=en-US";

    try {
      var movieDetail = await NetworkHelper().getData(url);
      return MovieDetail.fromJson(movieDetail);
    } catch (e) {
      print(e);
      throw 'Error';
    }
  }

  Future<LatestMovie> getLatestMovieContent() async {
    final url =
        "${NetworkData.MovieDbUrl}movie/latest?api_key=${NetworkData.ApiKey}&language=en-US";

    var data = await NetworkHelper().getData(url);

    return LatestMovie.fromJson(data);
  }
}
