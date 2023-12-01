import 'package:moive_app_task/model/profile_model.dart';

class ProfilePersonImageModel {
  int? id;
  List<ProfileModel>? profiles;

  ProfilePersonImageModel({this.id, this.profiles});

  factory ProfilePersonImageModel.fromJson(Map<String, dynamic> json) {
    List<ProfileModel> profilesList = [];

    if (json['profiles'] != null) {
      json['profiles'].forEach((element) {
        profilesList.add(ProfileModel.fromJson(element));
      });
    }

    return ProfilePersonImageModel(id: json['id'], profiles: profilesList);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "profiles": profiles!.map((v) => v.toJson()).toList()};
  }
}
