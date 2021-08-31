import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/services/ova.dart';
import 'package:myanime/services/special.dart';

class SpecialRepository extends BaseRepository<SpecialService, CategoryModel> {
  const SpecialRepository(SpecialService service) : super(service);

  @override
  Future<CategoryModel> fetchData() async {
    final response = await service.getSpecial();

    return CategoryModel.fromJson(response.data);
  }
}
