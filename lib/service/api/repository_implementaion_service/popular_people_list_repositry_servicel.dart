import '../../../model/popular_people_List_model.dart';
import '../../../utils/end_point.dart';
import '../../networking/dio_helper.dart';
import '../repository/popular_people_list_repositry.dart';

class PopularPeopleListRepositryService implements PopularPeopleListRepositry {
// Make it a SingleTon without using GetIt Pakcage
  static PopularPeopleListRepositryService? _instance;

  factory PopularPeopleListRepositryService() =>
      _instance ??= PopularPeopleListRepositryService._();

  PopularPeopleListRepositryService._();

  @override
  Future<PopularPeopleListModel> getPopular({required int pageID}) async {
    var response = await DioHelper().dio.get(EndPoint.poplarPeople,
        queryParameters: {
          "page": pageID,
          "api_key": "fdd781f0c3c5c144079ecc6c5ca41814"
        });

    return PopularPeopleListModel.fromJson(response.data);
  }
}
