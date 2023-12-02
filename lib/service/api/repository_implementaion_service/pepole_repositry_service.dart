import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../model/profile_person_image_model.dart';
import '../../../utils/end_point.dart';
import '../../networking/dio_helper.dart';
import '../repository/pepole_repositry.dart';

class PeopleRepositryService implements PepoleRepositry {
  static PeopleRepositryService? _instance;

  factory PeopleRepositryService() => _instance ??= PeopleRepositryService._();

  PeopleRepositryService._();

  @override
  Future<ProfilePersonImageModel> getImages({required int personId}) async {
    var response = await DioHelper().dio.get(
        EndPoint.profilePersonImage(person_id: personId),
        queryParameters: {
          "api_key": dotenv.get('API_KEY'), // To Protect Api Key
        });
    return ProfilePersonImageModel.fromJson(response.data);
  }

  @override
  getTaggedImages() {
    // TODO: implement getTaggedImages
    throw UnimplementedError();
  }

  @override
  getChanges() {
    // TODO: implement getChanges
    throw UnimplementedError();
  }

  @override
  getCombinedCredits() {
    // TODO: implement getCombinedCredits
    throw UnimplementedError();
  }

  @override
  getDetails() {
    // TODO: implement getDetails
    throw UnimplementedError();
  }

  @override
  getExternalIds() {
    // TODO: implement getExternalIds
    throw UnimplementedError();
  }

  @override
  getLatest() {
    // TODO: implement getLatest
    throw UnimplementedError();
  }

  @override
  getMovieCredits() {
    // TODO: implement getMovieCredits
    throw UnimplementedError();
  }

  @override
  getTranslations() {
    // TODO: implement getTranslations
    throw UnimplementedError();
  }

  @override
  getTvCredits() {
    // TODO: implement getTvCredits
    throw UnimplementedError();
  }
}
