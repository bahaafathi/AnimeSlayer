import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/ova.dart';
import 'package:myanime/services/ova.dart';

class OvaRepository extends BaseRepository<OvaService, Ova> {
  const OvaRepository(OvaService service) : super(service);

  @override
  Future<Ova> fetchData() async {
    final response = await service.getOva();

    return Ova.fromJson(response.data);
  }
}
