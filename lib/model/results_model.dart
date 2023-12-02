import 'package:hive/hive.dart';

import 'known_for__model.dart';

part 'results_model.g.dart';

@HiveType(typeId: 5)
class ResultsModel {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  int? gender;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? knownForDepartment;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? originalName;
  @HiveField(6)
  double? popularity;
  @HiveField(7)
  String? profilePath;
  @HiveField(8)
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
