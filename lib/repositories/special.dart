import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/ova.dart';
import 'package:myanime/models/special.dart';
import 'package:myanime/services/ova.dart';
import 'package:myanime/services/special.dart';

class SpecialRepository extends BaseRepository<SpecialService, Special> {
  const SpecialRepository(SpecialService service) : super(service);

  @override
  Future<Special> fetchData() async {
    final response = await service.getSpecial();

    return Special.fromJson(response.data);
  }
}
