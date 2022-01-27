import 'package:movie_app/data/network/api_end_point.dart';
import 'package:movie_app/data/network/base_service.dart';
import 'package:movie_app/data/network/themoviedb_service.dart';
import 'package:movie_app/helpers/function_helper.dart';
import 'package:movie_app/model/tv_show/tv_show_detail.dart';
import 'package:movie_app/model/tv_show/tv_show_list.dart';

class TvShowRepository {
  BaseService _service = TheMovieDBService();
  ApiEndPoints _endPoints = ApiEndPoints();

  Future<TvShowList> fetchTvShowList(String pageNo) async {
    var response =
        await _service.getResponse(_endPoints.getPopularTvShow + pageNo);
    return TvShowList.fromJson(response);
  }

  Future<TvShowDetail> fetchTvShowDetail(String id) async {
    String endPoint =
        FunctionHelper().insertIdInUrl(_endPoints.getTvShowById, id);
    var response = await _service.getResponse(endPoint);
    return TvShowDetail.fromJson(response);
  }
}
