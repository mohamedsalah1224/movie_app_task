import 'package:moive_app_task/model/results_model.dart';

class PopularPeopleListModel {
  int? page;
  List<ResultsModel>? results;
  int? totalPages;
  int? totalResults;

  PopularPeopleListModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory PopularPeopleListModel.fromJson(Map<String, dynamic> json) {
    List<ResultsModel> resultList = [];
    if (json['results'] != null) {
      json['results'].forEach((element) {
        resultList.add(ResultsModel.fromJson(element));
      });
    }

    return PopularPeopleListModel(
        page: json['page'],
        results: resultList, // this mean set a Result empty []
        totalPages: json['total_pages'],
        totalResults: json['total_results']);
  }

  Map<String, dynamic> toJson() {
    return {
      'total_pages': totalPages,
      'total_results': totalResults,
      'page': page,
      'results': results!
          .map((e) => e.toJson())
          .toList() //  not be null because i set  Result empty [] if it null
    };
  }
}
