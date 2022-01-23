import 'package:flutter/cupertino.dart';
import 'package:movie_app/helpers/networking/network_data.dart';
import 'package:movie_app/helpers/networking/network_helper.dart';
import 'package:movie_app/models/tv_show_model/tv_show_detail_model/tv_show_detail.dart';
import 'package:movie_app/models/tv_show_model/tv_show_list.dart';

enum TvShowState { OK, LOADING, ERROR }

class TvShowProvider with ChangeNotifier {
  late TvShowList _tvShows;

  TvShowList get tvShows => _tvShows;

  TvShowProvider() {
    fetchTvShowList();
  }

  late TvShowState _tvShowState;

  TvShowState get tvShowState => _tvShowState;

  set tvShowState(TvShowState state) {
    _tvShowState = state;
    notifyListeners();
  }

  int _pageNumber = 1;

  int get pageNumber => _pageNumber;

  void incrementPageNumber() {
    _pageNumber++;
  }

  Future<void> fetchTvShowList() async {
    final url =
        "${NetworkData.MovieDbUrl}tv/popular?api_key=${NetworkData.ApiKey}&language=en-US&page=$pageNumber";
    try {
      tvShowState = TvShowState.LOADING;
      var data = await NetworkHelper().getData(url);
      _tvShows = TvShowList.fromJson(data);
      tvShowState = TvShowState.OK;
      notifyListeners();
    } catch (Exception) {
      tvShowState = TvShowState.ERROR;
    }
  }

  Future<TvShowDetail> getTvShowById(int id) async {
    final url =
        "${NetworkData.MovieDbUrl}tv/$id?api_key=${NetworkData.ApiKey}&language=en-US";

    try {
      Map<String, dynamic> data = await NetworkHelper().getData(url);
      TvShowDetail detail = TvShowDetail.fromJson(data);
      return detail;
    } catch (e) {
      print(e);
      throw 'Error';
    }
  }
}
