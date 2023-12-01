import '../../../model/profile_person_image_model.dart';

abstract class PepoleRepositry {
  Future<ProfilePersonImageModel> getImages({required int personId});
  getDetails();
  getChanges();
  getCombinedCredits();
  getExternalIds();

  getLatest();
  getMovieCredits();
  getTvCredits();
  getTaggedImages();
  getTranslations();
}
