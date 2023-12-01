import 'known_for__model.dart';

class ResultsModel {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<KnownForModel>? knownFor;

  ResultsModel(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.knownFor});

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    List<KnownForModel> knownList = [];

    if (json['known_for'] != null) {
      json['known_for'].forEach((elemnt) {
        knownList.add(KnownForModel.fromJson(elemnt));
      });
    }

    return ResultsModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      knownFor: knownList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'known_for': knownFor!.map((e) => e.toJson()).toList(),
      'adult': adult,
      'id': id,
      'gender': gender,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
    };
  }
}
