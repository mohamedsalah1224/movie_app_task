class EndPoint {
  EndPoint._();

  /// Assets for imagesAccount
  /// assets/images/account.png
  static const String baseUrl = "https://api.themoviedb.org/3/";

  /// Assets for imagesChat
  /// assets/images/chat.png
  static const String poplarPeople = "person/popular";
// https://api.themoviedb.org/3/person/popular?api_key=fdd781f0c3c5c144079ecc6c5ca41814&page=2
  static String profilePersonImage({required int person_id}) {
    return "person/$person_id/images";
  }

  static String imagePath = "https://image.tmdb.org/t/p/original/";
}
