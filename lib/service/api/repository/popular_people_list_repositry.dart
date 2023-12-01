import '../../../model/popular_people_List_model.dart';

abstract class PopularPeopleListRepositry {
  Future<PopularPeopleListModel> getPopular({required int pageID});
}
