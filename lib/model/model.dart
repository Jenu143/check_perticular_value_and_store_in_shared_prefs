class ApiModel {
  late int page;
  late List<Results> result;
  late int totalPages;
  late int totalResults;

  ApiModel({
    required this.page,
    required this.result,
    required this.totalPages,
    required this.totalResults,
  });

  ApiModel.fromJson(Map<String, dynamic> json) {
    page = json["page"];

    //null check
    if (json["results"] != null) {
      result = <Results>[];

      json["results"].forEach((a) {
        result.add(Results.fromJson(a));
      });
    }

    // Results.fromJson(json["results"])
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
  }
}

class Results {
  late bool adult;
  late String backDropPath;
  late List genreKids;
  late int id;
  late String originalLang;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String posterPath;
  late String releaseDate;
  late String title;
  late bool video;
  late int voteAverage;
  late int voteCount;
  late bool boolList;

  Results({
    required this.adult,
    required this.backDropPath,
    required this.genreKids,
    required this.id,
    required this.originalLang,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.boolList,
    // required this.voteAverage,
    required this.voteCount,
  });
  Results.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backDropPath = json["backdrop_path"] ?? "";
    genreKids = json["genre_ids"];
    id = json["id"];
    originalLang = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = json["popularity"];
    posterPath = json["poster_path"] ?? "";
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    // voteAverage = int.parse(json["vote_average"]);
    voteCount = json["vote_count"];
    boolList = false;
  }
}

class CustomApiModel<T> {
  int? statusCode;
  T? data;
  String? msg;

  CustomApiModel({
    this.statusCode,
    this.data,
    this.msg,
  });
}
