class ProfileModel {
  double? aspectRatio;
  int? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  ProfileModel(
      {this.aspectRatio,
      this.height,
      this.iso6391,
      this.filePath,
      this.voteAverage,
      this.voteCount,
      this.width});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        aspectRatio: json['aspect_ratio'],
        height: json['height'],
        iso6391: json['iso_639_1'],
        filePath: json['file_path'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        width: json['width']);
  }

  Map<String, dynamic> toJson() {
    return {
      'aspect_ratio': aspectRatio,
      'height': height,
      'iso_639_1': iso6391,
      'file_path': filePath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'width': width
    };
  }
}
