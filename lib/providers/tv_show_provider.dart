import 'package:flutter/cupertino.dart';
import 'package:movie_app/helpers/networking/network_data.dart';
import 'package:movie_app/helpers/networking/network_helper.dart';
import 'package:movie_app/models/tv_show_model/tv_show_detail_model/tv_show_detail.dart';
import 'package:movie_app/models/tv_show_model/tv_show_list.dart';

enum TvShowState { OK, LOADING, ERROR }

class TvShowProvider with ChangeNotifier {
  late TvShowList _tvShowList;

  TvShowList get tvShowList => _tvShowList;

  int get listCount => _tvShowList.tvShows.length;

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
      _tvShowList = TvShowList.fromJson(data);
      tvShowState = TvShowState.OK;
    } catch (Exception) {
      tvShowState = TvShowState.ERROR;
    }
  }

  Future<void> fetchMoreTvShows() async {
    // it should be => pageNumber < _tvShowList.totalPages
    // however the api only allows up to 500th number
    if (pageNumber < 500) {
      print('more shows are coming');
      try {
        incrementPageNumber();
        final url =
            "${NetworkData.MovieDbUrl}tv/popular?api_key=${NetworkData.ApiKey}&language=en-US&page=$pageNumber";
        var data = await NetworkHelper().getData(url);
        var newShowList = TvShowList.fromJson(data);
        _tvShowList.page = newShowList.page;
        newShowList.tvShows.forEach((show) {
          _tvShowList.tvShows.add(show);
        });
        print('new length = ${listCount}');
        notifyListeners();
      } catch (exception) {
        throw 'Error';
      }
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
