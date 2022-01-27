import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/response/api_response.dart';
import 'package:movie_app/model/tv_show/tv_show_list.dart';
import 'package:movie_app/repository/tv_show_repository.dart';

class TvShowViewModel with ChangeNotifier {
  late ApiResponse _apiResponse;

  TvShowList? _tvShowList;
  int _pageNumber = 1;

  TvShowViewModel() {
    fetchTvShows(_pageNumber.toString());
  }
  ApiResponse get response {
    return _apiResponse;
  }

  TvShowList? get tvShowList => _tvShowList;

  Future<void> fetchTvShows(String page) async {
    _apiResponse = ApiResponse.loading('Fetching tv show data');
    notifyListeners();
    try {
      _tvShowList = await TvShowRepository().fetchTvShowList('1');
      _apiResponse = ApiResponse.completed(_tvShowList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  Future<ApiResponse> fetchTvShowById(String id) async {
    ApiResponse response = ApiResponse.loading('Fetching detail');
    try {
      var detail = await TvShowRepository().fetchTvShowDetail(id);
      response = ApiResponse.completed(detail);
    } catch (e) {
      response = ApiResponse.error(e.toString());
    }
    return response;
  }

  Future<void> fetchMoreTvShows() async {
    if (_pageNumber <= 500) {
      try {
        _apiResponse = ApiResponse.loading('Fetching movie data');
        _pageNumber++;
        final newShows =
            await TvShowRepository().fetchTvShowList(_pageNumber.toString());
        _tvShowList!.page = newShows.page;
        newShows.tvShows.forEach((show) {
          _tvShowList!.tvShows.add(show);
          _apiResponse = ApiResponse.completed(_tvShowList);
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
