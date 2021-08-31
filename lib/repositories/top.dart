import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/services/top.dart';

/// Handles retrieve and transformation of [ComapnyInfo] from the API.
class TopRepository extends BaseRepository<TopService, CategoryModel> {
  const TopRepository(TopService service) : super(service);

  @override
  Future<CategoryModel> fetchData() async {
    final response = await service.getTop();

    return CategoryModel.fromJson(response.data);
  }
}
