class StatusOfDownloadedImageAtGallaryModel {
  final bool isSuccess;
  final String filePath;
  final String errorMessage;

  StatusOfDownloadedImageAtGallaryModel(
      {this.errorMessage = "", this.filePath = "", required this.isSuccess});
}
