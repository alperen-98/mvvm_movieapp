import 'package:movie_app/data/network/api_end_point.dart';
import 'package:movie_app/data/network/base_service.dart';
import 'package:movie_app/helpers/function_helper.dart';
import 'package:movie_app/model/movie/latest_movie.dart';
import 'package:movie_app/model/movie/movie_detail.dart';
import 'package:movie_app/model/movie/movie_list.dart';
import 'package:movie_app/data/network/themoviedb_service.dart';

class MovieRepository {
  BaseService _service = TheMovieDBService();
  ApiEndPoints _endPoints = ApiEndPoints();

  Future<MovieList> fetchMovieList(String pageNo) async {
    var response =
        await _service.getResponse(ApiEndPoints().getPopularMovies + pageNo);
    return MovieList.fromJson(response);
  }

  Future<MovieDetail> fetchMovieDetail(String id) async {
    String endPoint =
        FunctionHelper().insertIdInUrl(_endPoints.getMovieById, id);
    var response = await _service.getResponse(endPoint);
    return MovieDetail.fromJson(response);
  }

  Future<LatestMovie> fetchLatestMovie() async {
    var response = await _service.getResponse(ApiEndPoints().getLatestMovie);
    return LatestMovie.fromJson(response);
  }
}
