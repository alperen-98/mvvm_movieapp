import 'package:movie_app/models/movie_model/movie_detail_model/genre.dart';
import 'package:movie_app/models/movie_model/movie_detail_model/production_country.dart';
import 'package:movie_app/models/movie_model/movie_detail_model/spoken_language.dart';
import 'package:movie_app/models/tv_show_model/tv_show_detail_model/season.dart';
import 'package:movie_app/models/tv_show_model/tv_show_detail_model/last_episode_to_air.dart';
import 'created_by.dart';
import 'network.dart';

class TvShowDetail {
  const TvShowDetail({
    required this.backdropPath,
    required this.episodeRunTime,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.name,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
    required this.lastAirDate,
    required this.firstAirDate,
    required this.lastEpisodeToAir,
    required this.nextEpisodeToAir,
    required this.createdBy,
  });
  final String? backdropPath;
  final List<CreatedBy> createdBy;
  final List<int> episodeRunTime;
  final int id;
  final List<Genre> genres;
  final String homepage;
  final String name;
  final bool inProduction;
  final List<String> languages;
  final List<Network> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final num popularity;
  final String? posterPath;
  final List<Network> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<Season> seasons;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final num voteAverage;
  final int voteCount;
  final DateTime firstAirDate;
  final DateTime lastAirDate;
  final LastEpisodeToAir lastEpisodeToAir;
  final dynamic nextEpisodeToAir;

  factory TvShowDetail.fromJson(Map<String, dynamic> json) => TvShowDetail(
        backdropPath: json["backdrop_path"],
        episodeRunTime: List<int>.from(json["episode_run_time"].map((e) => e)),
        genres: List<Genre>.from(json["genres"].map((g) => Genre.fromJson(g))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        languages: List<String>.from(json["languages"].map((lang) => lang)),
        name: json["name"],
        networks: List<Network>.from(
            json["networks"].map((n) => Network.fromJson(n))),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originCountry: List<String>.from(json["origin_country"].map((c) => c)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"] as double,
        posterPath: json["poster_path"],
        productionCompanies: List<Network>.from(
            json["production_companies"].map((c) => Network.fromJson(c))),
        productionCountries: List<ProductionCountry>.from(
            json["production_countries"]
                .map((c) => ProductionCountry.fromJson(c))),
        seasons:
            List<Season>.from(json["seasons"].map((s) => Season.fromJson(s))),
        spokenLanguages: List<SpokenLanguage>.from(
            json["spoken_languages"].map((l) => SpokenLanguage.fromJson(l))),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        createdBy: List<CreatedBy>.from(
            json["created_by"].map((x) => CreatedBy.fromJson(x))),
        firstAirDate: DateTime.parse(json['first_air_date']),
        lastAirDate: DateTime.parse(json["last_air_date"]),
        nextEpisodeToAir: null,
        lastEpisodeToAir:
            LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
      );
}
