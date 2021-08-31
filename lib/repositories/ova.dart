import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/services/ova.dart';

class OvaRepository extends BaseRepository<OvaService, CategoryModel> {
  const OvaRepository(OvaService service) : super(service);

  @override
  Future<CategoryModel> fetchData() async {
    final response = await service.getOva();

    return CategoryModel.fromJson(response.data);
  }
}
